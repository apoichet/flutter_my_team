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
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: getResponsiveWidth(10.0)),
              child: buildWidgetText(
                  text: player.nickName,
                  fontSize: getResponsiveSize(fontSize),
                  family: FontFamily.ARIAL,
                  weight: FontWeight.bold
              ),
            )
        ),
        Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: getResponsiveWidth(25.0)),
                child: buildWidgetText(
                    text: player.position,
                    fontSize: getResponsiveSize(fontSize),
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold
                ))
        ),
        Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: getResponsiveWidth(35.0)),
                child: buildWidgetText(
                    text: "Numéro " + player.number.toString(),
                    fontSize: getResponsiveSize(fontSize),
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold
                ))
        ),
      ],
    );
  }
}
