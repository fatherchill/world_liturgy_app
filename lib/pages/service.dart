import 'package:flutter/material.dart';

import '../json/serializePrayerBook.dart';
import '../globals.dart' as globals;
import '../parts/collects.dart';
import '../app.dart';
import 'calendar.dart';
import '../model/calendar.dart';
import '../parts/section.dart';

class ServicePage extends StatefulWidget {
  final initialCurrentIndexes;

  ServicePage({Key key, @required this.initialCurrentIndexes})
      : super(key: key);

  @override
  _ServicePageState createState() => new _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  Map currentIndexes;
  Service currentService;
  ScrollController _serviceScrollController = new ScrollController();
  String currentLanguage;
  Day currentDay;
  double textScaleFactor;

  _ServicePageState();

  @override
  void initState() {
    super.initState();
    currentIndexes = widget.initialCurrentIndexes;
    currentService = _getServiceFromIndexes(currentIndexes);
  }

  Service _getServiceFromIndexes(indexes) {
    return globals.allPrayerBooks
        .getPrayerBook(indexes['prayerBook'])
        .getService(indexes['service']);
  }

  void _changeLanguage() {
    int maxPbIndex = globals.allPrayerBooks.prayerBooks.length - 1;
    int currentPbIndex = globals.allPrayerBooks
        .getPrayerBookIndexById(currentIndexes['prayerBook']);
    int newPbIndex = currentPbIndex == maxPbIndex ? 0 : currentPbIndex + 1;

    currentIndexes['prayerBook'] =
        globals.allPrayerBooks.prayerBooks[newPbIndex].id;

    currentService = _getServiceFromIndexes(currentIndexes);
    RefreshState.of(context).onTap(
        newLanguage: globals.allPrayerBooks.prayerBooks[newPbIndex].language);
  }

  void _updateTextScale(double newValue) {
    setState(() {
//      textScaleFactor = transformed;
      RefreshState.of(context).onTap(newTextScale: newValue);
    });
  }

  void _changeService(String prayerBook, String service, previousService) {
    bool changingBook =
        currentIndexes['prayerBook'] == prayerBook ? false : true;
    currentIndexes['service'] = service;
    currentIndexes['prayerBook'] = prayerBook;
    currentService = _getServiceFromIndexes(currentIndexes);

    if (service != previousService) {
      _serviceScrollController.jumpTo(0.0);
    }

//    if changing prayerBooks
    if (changingBook) {
      RefreshState.of(context).onTap(
          newLanguage:
              globals.allPrayerBooks.getPrayerBook(prayerBook).language);
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final refreshState = RefreshState.of(context);
    currentLanguage = refreshState.currentLanguage;
    currentDay = refreshState.currentDay;
    textScaleFactor = refreshState.textScaleFactor;

    return new Theme(
        data: Theme.of(context),
        child: Scaffold(
          drawer: _buildDrawer(globals.allPrayerBooks.prayerBooks, context),
          appBar: AppBar(
            elevation: 1.0,
//          backgroundColor: kPrimaryLight,
            textTheme: Theme.of(context).textTheme,
            title: appBarTitle(currentService.title, context),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _changeLanguage();
                },
                padding: EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.swap_horiz,
                      color: Theme.of(context).primaryIconTheme.color,
                      size: 30.0,
                    ),
                    Text(globals.translate(currentLanguage, 'languageName'),
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context).primaryIconTheme.color,
                            )),
                  ],
                ),
              ),
            ],
          ),
          body: _buildService(currentService),
        ));
  }

  Drawer _buildDrawer(prayerBooks, context) {
    return Drawer(
      child: Column(children: <Widget>[
//        Container(
//          margin: EdgeInsets.only(top: 25.0),
//          height: 50.0,
//          child: Text(
//            'THIS WILL BE HEADER',
//            style: Theme.of(context).textTheme.title,
//          ),
//        ),
        AppBar(
          automaticallyImplyLeading: false,
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  drawerPrayerBookEntry(context, prayerBooks[index]),
              itemCount: prayerBooks.length,
            ),
          ),
        ),
        ListTile(
            title: Text('Zoom'),
            leading: Icon(Icons.zoom_in),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context, state) {
                      return Container(
                        height: 100.0,
                        padding: EdgeInsets.all(32.0),
                        child: Slider(
                          label: textScaleFactor.toString() + 'x',
                          min: 0.5,
                          max: 1.5,
                          value: textScaleFactor,
                          divisions: 10,
                          onChanged: (double value) {
                            updatedScale(state, value);
                            _updateTextScale(value);
                          },
                        ),
                      );
                    });
                  });
            })
      ]),
    );
  }

  Future<Null> updatedScale(StateSetter updateState, newFactor) async {
    updateState(() {
      textScaleFactor = newFactor;
    });
  }

  Widget drawerPrayerBookEntry(BuildContext context, PrayerBook prayerBook) {
    if (prayerBook.services.isEmpty)
      return new ListTile(title: new Text(prayerBook.title ?? 'No Title'));
    return new ExpansionTile(
      key: new PageStorageKey<PrayerBook>(prayerBook),
      title: new Text(
        prayerBook.title ?? 'No title',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      children: _buildServicesTiles(context, prayerBook),
      initiallyExpanded: prayerBook.id == currentIndexes['prayerBook'],
    );
  }

  List<Widget> _buildServicesTiles(context, prayerBook) {
    List<Widget> servicesList = [];
//    Service serviceName;
    for (var service in prayerBook.services) {
      servicesList.add(new Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: new ListTile(
            title: new Text(
              service.title ?? 'No title',
            ),
            selected: service.id == currentIndexes['service'] &&
                prayerBook.id == currentIndexes['prayerBook'],
            onTap: () {
              Navigator.pop(context);
              _changeService(
                  prayerBook.id, service.id, currentIndexes['service']);
            },
            dense: true,
          )));
    }
    return servicesList;
  }

  //TODO: Look at refactoring service building with widget classes
//  https://flutter.io/catalog/samples/expansion-tile-sample/
  Widget _buildService(Service service) {
    Day currentDay = getDay(context);
    return new ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemCount: service.sections.length,
      itemBuilder: (context, index) {
        var section = service.sections[index];
//        return SectionCard(
//          currentIndexes,
//          section,
//        );
        return _sectionType(section, currentIndexes, currentDay);
      },
      controller: _serviceScrollController,
    );
  }

  Widget _sectionType(section, currentIndexes, currentDay) {
    if (section.type == 'collectOfTheDay') {
      return CollectContent(currentIndexes["prayerBook"], "collect");
    } else if (section.type == 'postCommunionOfTheDay') {
      return CollectContent(currentIndexes["prayerBook"], "postCommunion");
    } else if (section.type == 'calendarDate') {
      return dayAndLinkToCalendar(currentIndexes, context);

    } else if (section.type == 'scheduled' &&
        section.schedule.contains(currentDay.season)) {
      return SectionContent(section);
    } else if (section.type == 'scheduledFeast' &&
        (section.schedule == currentDay.principalFeastID ||
            section.schedule == currentDay.holyDayID)) {
      return SectionContent(section);
    } else {
      if (section.visibility == 'collapsed') {
        return CollapsedSectionCard(section);
      } else if (section.visibility == 'indexed') {
        return IndexedSectionCard(section);
      } else if (section.visibility == 'hidden') {
      } else if (section.collects != null) {
        return CollectSectionContent(section);
      } else {
        return SectionContent(section);
      }
    }
    return Container();
  }
}
