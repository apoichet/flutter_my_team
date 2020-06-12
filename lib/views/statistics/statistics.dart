import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_image.dart';
import 'package:fc_parisii/components/header.dart';
import 'package:fc_parisii/components/menu_toggle.dart';
import 'package:fc_parisii/components/nav_bar/nav_bar.dart';
import 'package:fc_parisii/components/player_list.dart';
import 'package:fc_parisii/components/view_scaffold.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/views/statistics/collective/collective_statistics_menu.dart';
import 'package:fc_parisii/views/statistics/individual/individual_statistics.dart';

class Statistics extends StatefulWidget {

  final List<String> statMenus;
  final List<Player> players;

  const Statistics({
    Key key,
    @required this.players,
    this.statMenus = const ["Buts/Passes", "Encaissés", "Matchs", "Flops"]
  }) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final String title = 'Statistiques';

  final String imgBackgroundName1 = 'background_8.png';

  final String imgBackgroundName2 = 'background_3.png';

  final String menuTitle1 = 'Individuelles';

  final String menuTitle2 = 'Collectives';

  bool _toggleLeft;

  @override
  void initState() {
    _toggleLeft = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: _toggleLeft ? imgBackgroundName1 : imgBackgroundName2,
      child: ViewScaffold(
        navBarSelected: NavBarEnum.STATISTICS,
        rightPadding: 0.0,
        leftPadding: 0.0,
        header: Header(textHeader: title,
            backgroundColor: _toggleLeft ? Color.fromRGBO(0, 0, 0, 0.5) :
            Color.fromRGBO(255, 255, 255, 0.5),
          leftPadding: getResponsiveWidth(15.0),
          rightPadding: getResponsiveWidth(15.0)),
        body: WidgetToggle(
          callBackParent: _toggle,
          toggleLeft: _toggleLeft,
          image1: imgBackgroundName1,
          image2: imgBackgroundName2,
          header: title,
          menuUnderlineColor: Colors.white,
          title1: menuTitle1,
          widget1: PlayerList(onTapPlayerParent: (Player playerTap) {
            Navigator.push(context, buildNoAnimationRoute(IndividualStatistics(playerTap)));
          }),
          colorDisabledTitle1: Colors.white.withOpacity(0.5),
          colorEnabledTitle1: Colors.white,
          title2: menuTitle2,
          widget2: CollectiveStatisticsMenu(statMenus: widget.statMenus),
          colorDisabledTitle2: Color.fromRGBO(0, 0, 0, 0.5),
          colorEnabledTitle2: Colors.white,
        ),
      ),
    );
  }

  void _toggle(bool toggleState) {
    setState(() {
      _toggleLeft = toggleState;
    });
  }
}
