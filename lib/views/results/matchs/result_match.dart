import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player_position.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class ResultMatch extends StatefulWidget {
  @override
  _ResultMatchState createState() => _ResultMatchState();
}

class _ResultMatchState extends State<ResultMatch> {

  bool _toggleLeft;

  @override
  void initState() {
    _toggleLeft = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5)

            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildToggleTopic("Matchs passés", _toggleLeft),
                _buildToggleTopic("Match à venir", !_toggleLeft)
              ],
            ),
          ),

        ),
        Expanded(
          flex: 9,
          child: Container(),
        )

      ],


    );
  }

  _buildToggleTopic(String topic, bool conditionToggle) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(!conditionToggle) {
            _toggleLeft = !_toggleLeft;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(12.0),
          vertical: getResponsiveHeight(5.0)
        ),
        decoration: BoxDecoration(
            color: conditionToggle ? Color.fromRGBO(10, 39, 76, 1.0) : Colors.transparent,
            borderRadius: BorderRadius.circular(50.0)
        ),
        child: buildWidgetText(
          text: topic,
          color: Colors.white,
          fontSize: getResponsiveSize(20.0),
          family: FontFamily.ARIAL,
        ),
      ),
    );
  }

}
