import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class HeaderCard extends StatelessWidget {
  final Player player;
  final double fontSize;

  HeaderCard({
    this.player,
    this.fontSize = 15.0
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: buildWidgetText(
                          text: player.nickName,
                          fontSize: getResponsiveWidth(fontSize),
                          family: FontFamily.ARIAL,
                          weight: FontWeight.bold
                      )
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: buildWidgetText(
                          text: "Numéro " + player.number.toString(),
                          fontSize: getResponsiveWidth(fontSize),
                          family: FontFamily.ARIAL,
                          weight: FontWeight.bold
                      )
                  ),
                )
              ],
            )
        ),
        Expanded(
            child: Container(
                alignment: Alignment.center,
                child: buildWidgetText(
                    text: player.position,
                    fontSize: getResponsiveWidth(fontSize),
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold
                ))
        )
      ],
    );
  }
}
