import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

class IndividualStatisticsHeaderCard extends StatelessWidget {
  final Player player;

  IndividualStatisticsHeaderCard(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: "Nom : ",
                      color: Colors.white,
                      fontSize: 16.0,
                      weight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      family: FontFamily.ARIAL
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Center(
                  child: buildWidgetText(
                      text: player.nickName,
                      color: Colors.white,
                      fontSize: 22.0,
                      weight: FontWeight.bold,
                      family: FontFamily.ARIAL
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: "Poste : ",
                      color: Colors.white,
                      fontSize: 16.0,
                      weight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      family: FontFamily.ARIAL
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getResponsiveHeight(5.0)
                    ),
                    child: buildWidgetText(
                        text: player.position,
                        color: Colors.white,
                        fontSize: 22.0,
                        weight: FontWeight.bold,
                        family: FontFamily.ARIAL
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: "Num : ",
                      color: Colors.white,
                      fontSize: 16.0,
                      weight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      family: FontFamily.ARIAL
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Center(
                  child: buildWidgetText(
                      text: player.number.toString(),
                      color: Colors.white,
                      fontSize: 25.0,
                      weight: FontWeight.bold,
                      family: FontFamily.ARIAL
                  ),
                ),
              )
            ],

          ),
        ),

      ],


    );

  }

}
