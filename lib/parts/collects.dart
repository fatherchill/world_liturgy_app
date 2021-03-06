part of 'section.dart';

/// CollectContent is used to render certain collect fields within a service.
/// For the section of the prayerBook with the list of all collects, see [CollectSectionContent]
class CollectContent extends GeneralContent {
  final String currentPrayerBookLang;
  final String buildType;

  CollectContent(this.currentPrayerBookLang, [this.buildType = 'full']);

  @override
  Widget build(BuildContext context) {
    Day day = getDay(context);
    List<Widget> list = [];
    Collect collectOfPrincipalFeast ;

    if(day.isHolyDay()){
      if(day.principalDay() != null){
        Collect c = setCollect(day.principalDay().id, currentPrayerBookLang);
        collectOfPrincipalFeast = c;
        if (hasContentToBuild(c, buildType)) {
          list.add(_rubric(
              globals.translationMap[getLanguage(context)]['dates']['types']
              ['principalFeast'] + ':',
              context));
          list.add(DailyPrayersContent(c, buildType));
        }
      }
    }
    if(day.season != null){
      Collect c = setCollect(day.weekId(), currentPrayerBookLang);
      if (hasContentToBuild(c, buildType)) {
        if (buildType == 'titles') {
          String season = globals.translationMap[getLanguage(context)]['dates']['seasons'][day.season.id];

          if(season != null && season.isNotEmpty) {
            list.add(_rubric(
                globals.translationMap[getLanguage(context)]['dates']['types']
                ['season'] + ':', context));
            list.add(_collectTitle(season, context));
//            print(day.weekId());
          }
        } else if( c != collectOfPrincipalFeast){
          list.add(_rubric(globals.translationMap[getLanguage(context)]['dates']['types']
          ['prayerOfTheWeek'] + ':', context));
          list.add(DailyPrayersContent(c, buildType));
        }
      }
    }

    if(day.nonPrincipalDays() != null) {
      day.nonPrincipalDays().forEach((hd) {
        Collect c = setCollect(hd.id, currentPrayerBookLang);
        if (hasContentToBuild(c, buildType)) {
          list.add(_rubric(
              globals.translationMap[getLanguage(context)]['dates']['types']
              ['holyDay'] + ':', context));
//        if this has fallen on another feast day or sunday in Advent, lent or easter, then it has been transferred to the next day.
          if(hd.dateTransferredFrom != null){
            String transferredNotice = globals.translationMap[getLanguage(context)]['dates']['transferred'];
            transferredNotice = '(' + transferredNotice + hd.dateTransferredFrom.day.toString() + ' ';
            transferredNotice = transferredNotice + globals.translationMap[getLanguage(context)]['dates']['month'][hd.dateTransferredFrom.month] + ')';

            list.add(_rubric(transferredNotice, context));
          }
          list.add(DailyPrayersContent(c, buildType));
        }
      });
    }

    if (buildType == 'titles') {
      return Column(
        children: list,
      );
    }
    return _sectionCard(Column(
      children: list,
    ));
  }

  Collect setCollect(String collectId, String prayerBookLang) {

    return globals.allPrayerBooks.getPrayerBook(language: prayerBookLang).getCollectAndInfo(collectId);
  }


  bool hasContentToBuild(Collect collect, buildType) {
    if (collect != null) {
      switch (buildType) {
        case "full":
          {
            return true;
          }
          break;

        case "titles":
          {
            return true;
          }
          break;

        case 'collect':
          {
            return collect.collectPrayers != null;
          }
          break;

        case 'postCommunion':
          {
            return collect.postCommunionPrayers != null;
          }
          break;
      }
    }

    return false;
  }
}
