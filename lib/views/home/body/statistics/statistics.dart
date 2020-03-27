import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class _StatisticsState extends State<Statistics> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: _buildHeader()
        ),
        Expanded(
            child: _buildTopics()
        ),
        Expanded(
          flex: 8,
            child: FittedBox(
              child: _buildSwipe(),
            )
        )

      ],
    );
  }

  _buildHeader() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CustomColors.OrangeTransparent,
        borderRadius: BorderRadius.circular(50)
      ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: buildWidgetText(
            text: "Prochain Match",
            family: FontFamily.ARIAL,
            size: 25,
            weight: FontWeight.bold
        )
    );
  }

  _buildTopics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildWidgetText(
            text: "Individuel",
            family: FontFamily.ARIAL,
            size: 25,
            weight: FontWeight.bold
        ),
        buildWidgetText(
            text: "Collectives",
            family: FontFamily.ARIAL,
            size: 25,
            weight: FontWeight.bold
        )
      ]
    );
  }

  _buildSwipe() {

  }

}

class Statistics extends StatefulWidget {

  final List<Player> players;

  const Statistics({Key key, @required this.players}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatisticsState();
}
