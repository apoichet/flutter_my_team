import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/statistics/individual/individual_statistics.dart';

import '../../components/view_scaffold.dart';

class _StatisticsState extends State<Statistics> {

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: "background_8.png",
      child: ViewScaffold(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Header(
                    textHeader: "Statistiques"
                )
            ),
            Expanded(
                child: _buildTopics()
            ),
            Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(top: getResponsiveHeight(10.0)),
                  child: PlayerList(
                    onTapPlayerParent: _goToIndividualPlayerStatistics,
                  ),
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
          _buildUnderlineText(text: "Individuel", underlineColor: Colors.white),
          _buildUnderlineText(text: "Collective", underlineColor: Colors.transparent),
        ]
    );
  }

  _buildUnderlineText({String text, Color underlineColor}) {
    return Container(
      padding: EdgeInsets.only(bottom: 3.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: underlineColor,  // Text colour here
            width: 3.0, // Underline width
          ))
      ),
      child: buildWidgetText(
          fontSize: getResponsiveSize(23.0),
          text: text,
          family: FontFamily.ARIAL,
          weight: FontWeight.bold
      ),
    );
  }

  _goToIndividualPlayerStatistics(Player playerTap) {
    int indexPlayerSelected = getTeam().players.indexOf(playerTap);
    Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualStatistics(
      indexPlayer: indexPlayerSelected,
    )));
  }

}

class Statistics extends StatefulWidget {

  final List<Player> players;

  const Statistics({Key key, @required this.players}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatisticsState();
}
