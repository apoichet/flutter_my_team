import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class _StatisticsState extends State<Statistics> {

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: "background_8.png",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: _buildHeader()
            ),
            Expanded(
                flex: 2,
                child: _buildTopics()
            ),
            Expanded(
                flex: 7,
                child: _buildSwipe()
            ),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(
              'assets/icon/backward_arrow_icon.svg',
              fit: BoxFit.fill,
              semanticsLabel: 'Nav Bar Icon'),
        ),
        Center(
          child: Container(
              height: 43,
              width: 182,
              decoration: BoxDecoration(
                  color: CustomColors.BlackBackgroundChart,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Align(
                alignment: Alignment.center,
                child: buildWidgetText(
                    text: "Statistiques",
                    family: FontFamily.MONTSERRAT_ALTERNATES,
                    size: 25,
                    weight: FontWeight.w600
                ),
              )
          ),
        ),
      ],
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
      padding: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: underlineColor,  // Text colour here
            width: 3.0, // Underline width
          ))
      ),
      child: buildWidgetText(
          text: text,
          family: FontFamily.ARIAL,
          size: 23,
          weight: FontWeight.bold
      ),
    );
  }

  _buildSwipe() {
    return PlayerList();
  }

}

class Statistics extends StatefulWidget {

  final List<Player> players;

  const Statistics({Key key, @required this.players}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatisticsState();
}
