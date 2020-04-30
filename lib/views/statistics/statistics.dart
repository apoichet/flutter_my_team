import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/menu_toggle.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/route_service.dart';
import 'package:my_team/views/statistics/collective/collective_statistics_menu.dart';
import 'package:my_team/views/statistics/individual/individual_statistics.dart';

class Statistics extends StatelessWidget {

  final String title = 'Statistiques';
  final String imgBackgroundName1 = 'background_8.png';
  final String imgBackgroundName2 = 'background_3.png';

  final String menuTitle1 = 'Individuelles';
  final String menuTitle2 = 'Collectives';


  final List<String> statMenus;
  final List<Player> players;

  const Statistics({
    Key key,
    @required this.players,
    this.statMenus = const ["Buts/Passes", "Encaissés", "Matchs", "Flops"]
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuToggle(
      navBarSelected: NavBarEnum.STATISTICS,
      image1: imgBackgroundName1,
      image2: imgBackgroundName2,
      header: title,
      backgroundHeader1: Color.fromRGBO(0, 0, 0, 0.5),
      backgroundHeader2: Color.fromRGBO(255, 255, 255, 0.5),
      menuUnderlineColor: Colors.white,
      menuTitle1: menuTitle1,
      widgetMenu1: PlayerList(onTapPlayerParent: (Player playerTap) {
        Navigator.push(context, buildNoAnimationRoute(IndividualStatistics(
          player: playerTap,
          statMenus: statMenus,
        )));
      }),
      colorDisabledMenuTitle1: Colors.white.withOpacity(0.5),
      colorEnabledMenuTitle1: Colors.white,
      menuTitle2: menuTitle2,
      widgetMenu2: CollectiveStatisticsMenu(statMenus: statMenus),
      colorDisabledMenuTitle2: Color.fromRGBO(0, 0, 0, 0.5),
      colorEnabledMenuTitle2: Colors.white,
    );
  }
}
