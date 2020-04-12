import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class TopicPosition extends StatelessWidget {

  final List<PlayerGamePosition> gamePositions;

  TopicPosition(this.gamePositions);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(15.0)
      ),
      decoration: BoxDecoration(
          color: CustomColors.BlackBackgroundChart,
          borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(10.0)
        ),
        itemCount: gamePositions.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 1.0,
          color: Colors.white.withOpacity(0.5),
        ),
        itemBuilder: (BuildContext context, int index) {
          return  Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: gamePositions[index].position,
                      family: FontFamily.ARIAL,
                      weight: FontWeight.bold,
                      fontSize: getResponsiveWidth(16.0)
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: buildWidgetText(
                            text: gamePositions[index].count.toString(),
                            family: FontFamily.ARIAL,
                            weight: FontWeight.bold,
                            fontSize: 25.0
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildWidgetText(
                              text: "fois",
                              family: FontFamily.ARIAL,
                              fontSize: 20.0
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
