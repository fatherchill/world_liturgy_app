import '../bible_format.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:core';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';
import '../parts.dart';

class USXBible extends BibleFormat {
  final String publicationID;
  Map<String, XmlDocument> booksData = {};
  Map bibleMetadata;
  Map<String, Map<String, dynamic>> bookTitlesAndChapters;

  USXBible({
    path,
    this.publicationID,
  }) : super(path: path) {
    initializeMetadata();
  }

  @override
  Map getBookTitlesAndChapters() {
    return bookTitlesAndChapters;
  }

  @override
  Future<List<Widget>> renderPassage(BibleRef ref) async {
    XmlDocument bookXml;
    if(booksData.containsKey(ref.bookAbbr)){
      bookXml = booksData[ref.bookAbbr];
    } else {
      bookXml= await getFutureBook(ref.bookAbbr);
      booksData[ref.bookAbbr] = bookXml;
    }
    List<Widget> chapter = [];

    var xmlStart = bookXml
        .findElements('usx')
        .first
        .findElements('chapter')
        .firstWhere((ch) =>
            ch is XmlElement &&
            ch.getAttribute('number') == ref.chapter.toString())
        .following;

    for (var node in xmlStart) {
      if (node is XmlElement) {
        String type = node.name.qualified;
        String elementStyle = node.getAttribute('style');
        if (type == 'chapter') {
          break;
        } else if (type == 'para' && !isIgnoredParagraphStyle(elementStyle)) {
          if (isIgnoredParagraphStyle(elementStyle)) break;
          List paragraphParts = [];
//            List<TextSpan> elements = [];
          for (var child in node.children) {
            if (child is XmlElement) {
              if (child.name.qualified == 'verse') {
                paragraphParts.add({'vNumber': child.getAttribute('number')});
//                  elements.add(TextSpan(text: child.getAttribute('number') + '\u{2074}',));
              } else if (child.name.qualified == 'char' &&
                  child.getAttribute('style') == 'wj') {
                paragraphParts.add(child.text);
              }
            } else {
              paragraphParts.add(child.text);
//                elements.add(TextSpan(text:child.text,));
            }
          }
          chapter
              .add(selectParagraphBuilder(elementStyle.trim(), paragraphParts));
        }
      }
    }

    //          add blank space at bottom of chapter
    chapter.add(Container(
      height: 100.0,
    ));
    return chapter;
  }

  @override
  int getChaptersInBook(book) {
    print('getChaptersInBook()');

    return null;
  }

  @override
  int getVersesInChapter(chapter) {
    print('getVersesInChapter()');
    return null;
  }

  initializeMetadata() async {
    Map data = await _loadJson(path + '/metadata.xml');
    bibleMetadata = data;
    String versification =
        await _getStringFromFile(path + '/release/versification.vrs');
    setBooksAndChapters(versification);
  }

//  openBook(String book) {
//    waitForBook(book, bookTitlesAndChapters[book]['src']);
////    return true;
//  }

  Future<XmlDocument> getFutureBook(bookAbbrev) async {
    return _loadXML(path + '/' + bookTitlesAndChapters[bookAbbrev]['src']);
  }

  setBooksAndChapters(String versificationData) {
    Map<String, Map<String, dynamic>> masterMap = {};

    List bookList = bibleMetadata['DBLMetadata']['publications']['publication']
        .firstWhere((e) => e['id'] == publicationID)['structure']['content'];

    List bookTitlesList = bibleMetadata['DBLMetadata']['names']['name'];

    bookList.forEach((element) {
      Map bookTitles =
          bookTitlesList.firstWhere((e) => e['id'] == element['name']);

      masterMap[element['role']] = {
        'src': element['src'],
        'abbr': bookTitles['abbr']['\$t'],
        'short': bookTitles['short']['\$t'],
        'long': bookTitles['long']['\$t'],
      };
    });

    List<String> chapterCounts = versificationData
        .split('#')
        .firstWhere((String s) => s.startsWith(" Verse number is the maximum "))
        .split('\n');

    chapterCounts.forEach((String data) {
      List asList = data.split(' ');

      if (masterMap.containsKey(asList.first)) {
        masterMap[asList.first]['chapters'] =
            asList.last.split(':').first.toString();
      }
    });

    bookTitlesAndChapters = masterMap;
  }

  waitForBook(String abbr, String bookLocation) async {
    booksData[abbr] = await _loadXML(path + '/' + bookLocation);

//    return currentXMLBook;
  }

  selectParagraphBuilder(String style, List parts) {
    if (['p,m'].contains(style)) {
      return BibleParagraphBasic(parts);
    } else if (['pm,pmo, pmc, mi'].contains(style)) {
      return BibleParagraphIndented(parts);
    } else if (style == 'pmr') {
      return BibleParagraphIndented(parts, TextAlign.right);
    } else if (style == 'nb') {
      return BibleParagraphNoBreak(parts);
    } else if (style == 'b') {
      return PoetryBlankLine();
    } else if (['sp', 'd'].contains(style)) {
      return BiblePassageHeading(parts);
    } else if (['ms1'].contains(style)) {
      return BibleMajorSection(parts);
    } else if (['q', 'q1', 'q2', 'q3', 'q4', 'qc', 'qr', 'qs']
        .contains(style)) {
      int indent = int.tryParse(style.split('').last) ?? 0;
      return BiblePoetryStanza(parts, indent);
    } else {
      return BibleParagraphBasic(parts);
    }
//    d, b, sp, li1, nb,
  }

  bool isIgnoredParagraphStyle(style) {
    List<String> ignoredStyles = [
//      'ms1',
      'ide',
      'toc1',
      'toc2',
      'toc3',
      'mt1',
    ];

    return ignoredStyles.contains(style);
  }
}

Future<XmlDocument> _loadXML(fileName) async {
  String xmlAsString = await _getStringFromFile(fileName);
  xmlAsString.replaceAll(new RegExp(r">\r\n( +)?<"), '><');
  return parse(xmlAsString.replaceAll(new RegExp(r">\r\n( +)?<"), '><'));
}

/// Assumes the given path is a text-file-asset.
Future<String> _getStringFromFile(String path) {
  return rootBundle.loadString(path);
}

Future<Map> _loadJson(fileName) async {
  String xmlAsString = await _getStringFromFile(fileName);
  xmlAsString.replaceAll(new RegExp(r">\r\n( +)?<"), '><');

  final Xml2Json myTransformer = new Xml2Json();
  myTransformer.parse(xmlAsString.replaceAll(new RegExp(r">\r\n( +)?<"), '><'));

  return json.decode(myTransformer.toGData());
}
