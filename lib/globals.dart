library world_liturgy_app.globals;

import 'json/serializePrayerBook.dart';
import 'model/songBook.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/bible.dart';
import 'model/calendar.dart';

PrayerBooksContainer allPrayerBooks;
LitCalendar calendar;
List<SongBook> allSongBooks;
SharedPreferences preferences;
List<Bible> bibles;

final String appTitle = 'World Liturgy App';
//final String appTitle = 'ACK Kitabu Kipya Cha Ibada';

final List<String> languageList = ['sw_ke','en_ke'];


Map translationMap = {
  'en_ke': {
//    GENERAL TRANSLATIONS
    'languageName': 'English',

//  Prompts
    'yes': 'Yes',
    'no': 'No',
    'exitMessage': 'Do you want to exit?',

//    Tab names
    'songs': 'Songs',
    'prayerBook': 'Prayer Book',
    'lectionary': 'Lectionary',
    'bible': 'Bible',
    'calendar': 'Calendar',

//    TRANSLATIONS FOR INSTRUCTIONS
    'or': 'or',
    'tapToExpand': 'Tap to Expand',
    'search': 'Search',

//    TRANSLATIONS FOR TERMS
    'collect': 'Collect',
    'postCommunionPrayer': 'Post-Communion Prayer',

//    TRANSLATIONS FOR LEADERS
    'leader': 'Leader',
    'minister': 'Minister',
//    'deacon':'Deacon,
    'bishop': 'Bishop',
//    'archbishop': 'Archbishop',
    'reader': 'Reader',
    'question': 'Question',

//    TRANSLATIONS FOR PEOPLE SIDE
    'people': 'People',
    'all': 'All',
    'answer': 'Answer',

//    TRANSLATIONS FOR DATES AND SEASONS
    'dates': {
      'format': ['weekday', ', ', 'day', ' ', 'month', ', ', 'year'],
      'month': {
        1: 'January',
        2: 'February',
        3: 'March',
        4: 'April',
        5: 'May',
        6: 'June',
        7: 'July',
        8: 'August',
        9: 'September',
        10: 'October',
        11: 'November',
        12: 'December',
      },
      'weekday': {
        1: 'Monday',
        2: 'Tuesday',
        3: 'Wednesday',
        4: 'Thursday',
        5: 'Friday',
        6: 'Saturday',
        7: 'Sunday',
      },
      'seasons': {
        'advent': 'Advent',
        'christmas': 'Christmas',
        'epiphany': 'Epiphany',
//        'preLent': '',
        'lent': 'Lent',
        'easter': 'Easter',
        'lastSundayAfterTrinity': '',
        'preAdvent': '',
      },
      'types': {
        'holyDay': 'Holy Day',
        'principalFeast': 'Principal Feast',
        'season': 'Season',
        'prayerOfTheWeek': 'Prayer of the Week',
      },
      'transferred': 'Transferred from ',

    }
  },
  'sw_ke': {
    //    GENERAL TRANSLATIONS
    'languageName': 'Kiswahili',

//  Prompts
    'yes': 'Ndiyo',
    'no': 'Hapana',
    'exitMessage': 'Je, unataka kutoka?',

//    Tab names
    'songs': 'Nyimbo',
    'prayerBook': 'Maombi',
    'lectionary': 'Masomo',
    'bible': 'Biblia',
    'calendar': 'Kalenda',

//    TRANSLATIONS FOR INSTRUCTIONS
    'or': 'au',
    'tapToExpand': 'Bonyeza usome zaidi.',
    'search': 'Tafuta',

    //    TRANSLATIONS FOR TERMS
    'collect': 'Sala',
    'postCommunionPrayer': 'Baada ya Ushirika',

//    TRANSLATIONS FOR LEADERS
    'leader': 'Kiongozi',
    'minister': 'Kasisi',
    'bishop': 'Askofu',
//    'archbishop': 'Archbishop',
    'reader': 'Msomaji',
    'question': 'Swali',

//    TRANSLATIONS FOR PEOPLE SIDE
    'people': 'Watu',
    'all': 'Wote',
    'answer': 'Jibu',

    //    TRANSLATIONS FOR DATES
    'dates': {
      'format': ['weekday', ', ', 'day', ' ', 'month', ', ', 'year'],
      'month': {
        1: 'Januari',
        2: 'Februari',
        3: 'Machi',
        4: 'Aprili',
        5: 'Mei',
        6: 'Juni',
        7: 'Julai',
        8: 'Agosti',
        9: 'Septemba',
        10: 'Oktoba',
        11: 'Novemba',
        12: 'Desemba',
      },
      'weekday': {
        1: 'Jumatatu',
        2: 'Jumanne',
        3: 'Jumatano',
        4: 'Alhamisi',
        5: 'Ijumaa',
        6: 'Jumamosi',
        7: 'Jumapili',
      },
      'seasons': {
        'advent': 'Wakati wa Majilio',
        'christmas': 'Krismasi',
        'epiphany': 'Udhihirisho',
        'preLent': '',
        'lent': 'Wakati wa Saumu',
        'easter': 'Pasaka',
        'lastSundayAfterTrinity': '',
        'preAdvent': '',
      },
      'types': {
        'holyDay': 'Siku Takatifu',
        'principalFeast': 'Siku Kuu Takatifu',
        'season': 'Msimu',
        'prayerOfTheWeek': 'Sala ya Wiki',
      },
      'transferred': 'Imetolewa kutoka ',
    }
  }
};

String translate(language, key) {
  try {
    String translation = translationMap[language][key];
    return translation != null ? translation : '';
  } catch (e) {
    print('Translation Error: ' + language.toString() + 'AND' + key.toString());
    print(e.toString());
    return '';
  }
}
