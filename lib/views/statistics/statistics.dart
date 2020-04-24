import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/menu_toggle.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/route_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/views/statistics/collective/collective_statistics_menu.dart';
import 'package:my_team/views/statistics/individual/individual_statistics.dart';

class Statistics extends StatelessWidget {

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
      image1: "background_8.png",
      image2: "background_3.png",
      header: "Statistiques",
      backgroundHeader1: CustomColors.BlackBackgroundChart,
      backgroundHeader2: Color.fromRGBO(255, 255, 255, 0.45),
      menuUnderlineColor: Colors.white,
      menuTitle1: "Individuel",
      widgetMenu1: PlayerList(onTapPlayerParent: (Player playerTap) {
        int indexPlayerSelected = getTeam().players.indexOf(playerTap);
        Navigator.push(context, buildNoAnimationRoute(IndividualStatistics(
          indexPlayer: indexPlayerSelected,
          statMenus: statMenus,
        )));
      }),
      colorDisabledMenuTitle1: Colors.white.withOpacity(0.5),
      colorEnabledMenuTitle1: Colors.white,
      menuTitle2: "Collective",
      widgetMenu2: CollectiveStatisticsMenu(statMenus: statMenus),
      colorDisabledMenuTitle2: Colors.white.withOpacity(0.5),
      colorEnabledMenuTitle2: Color.fromRGBO(111, 111, 111, 0.5),
    );
  }
}
