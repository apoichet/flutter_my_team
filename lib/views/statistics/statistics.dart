import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/route_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/statistics/collective/collective_statistics.dart';
import 'package:my_team/views/statistics/individual/individual_statistics.dart';

import '../../components/view_scaffold.dart';

class _StatisticsState extends State<Statistics> {

  bool individual;
  List<String> statMenus;

  @override
  void initState() {
    individual = true;
    statMenus = ["Buts/Passes", "Encaissés", "Matchs", "Flops"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: individual ? "background_8.png" : "background_3.png",
      child: ViewScaffold(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Header(
                  textHeader: "Statistiques",
                  backgroundColor: individual ? CustomColors.BlackBackgroundChart : Color.fromRGBO(255, 255, 255, 0.45),
                )
            ),
            Expanded(
                child: _buildTopics()
            ),
            Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(top: getResponsiveHeight(10.0)),
                  child: individual ? PlayerList(
                    onTapPlayerParent: _goToIndividualPlayerStatistics,
                  ) : _buildCollectiveWidget(),
                )
            ),
          ],
        ),
      ),
    );
  }

  _buildTopics() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildUnderlineText(
              text: "Individuel",
              textColor: individual ? Colors.white : Colors.white.withOpacity(0.5),
              underlineColor: individual ? Colors.white : Colors.transparent,
              individualState: true
          ),
          _buildUnderlineText(
              text: "Collective",
              textColor: individual ? Colors.white.withOpacity(0.5) : Colors.white,
              underlineColor: individual ? Colors.transparent : Colors.white,
              individualState: false
          ),
        ]
    );
  }

  _buildUnderlineText({String text, Color underlineColor, Color textColor, bool individualState}) {
    return GestureDetector(
      onTap: () => _changeStat(individualState),
      child: Container(
        padding: EdgeInsets.only(bottom: 3.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              color: underlineColor,  // Text colour here
              width: 3.0, // Underline width
            ))
        ),
        child: buildWidgetText(
            color: textColor,
            fontSize: getResponsiveSize(23.0),
            text: text,
            family: FontFamily.ARIAL,
            weight: FontWeight.bold
        ),
      ),
    );
  }

  _changeStat(bool individualState) {
    setState(() {
      individual = individualState;
    });
  }

  _goToIndividualPlayerStatistics(Player playerTap) {
    int indexPlayerSelected = getTeam().players.indexOf(playerTap);
    Navigator.push(context, buildNoAnimationRoute(IndividualStatistics(
      indexPlayer: indexPlayerSelected,
      statMenus: statMenus,
    )));
  }

  _buildCollectiveWidget() {
    return BackgroundGradient(
        colors: [
          Color.fromRGBO(165, 201, 219, 0.44),
          Color.fromRGBO(165, 201, 219, 0.10)
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(20.0),
            vertical: getResponsiveHeight(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: statMenus.map((menu) =>
                Expanded(
                  child: GestureDetector(
                    onTap: () => _goToCollectiveStats(statMenus.indexOf(menu)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getResponsiveHeight(5.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Colors.white
                            ),
                            color: Color.fromRGBO(242, 242, 242, 0.49),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: buildWidgetText(
                            text: menu,
                            family: FontFamily.ARIAL,
                            weight: FontWeight.bold,
                            fontSize: getResponsiveHeight(25.0)
                        ),
                      ),
                    ),
                  ),
                )
            ).toList(),
          ),
        ));
  }

  _goToCollectiveStats(int index) {
    Navigator.push(context, buildNoAnimationRoute(CollectiveStatistics(
      indexTopic: index,
      topics: statMenus,
    )));
  }

}

class Statistics extends StatefulWidget {

  final List<Player> players;

  const Statistics({Key key, @required this.players}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatisticsState();
}
