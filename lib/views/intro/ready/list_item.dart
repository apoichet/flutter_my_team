import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class ListItem extends StatelessWidget {
  final Player player;
  final Color color;
  final pathImage = 'assets/img/';
  final definitionImage = 'png';

  ListItem({this.player, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.all(3.0),
      decoration: new BoxDecoration(
          color: color,
          border: Border.all(
              width: 1.2,
              color: Colors.white
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: getResponsiveHeight(40.0),
            child: Image.asset(
              "assets/img/player/" + player.avatar + ".png",
              filterQuality: FilterQuality.high,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: getResponsiveWidth(10.0)),
            child: Row(
                children: <Widget>[
                  buildWidgetText(
                      text: player.firstName,
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(20.0)
                  ),
                  buildWidgetText(
                      text: player.lastName,
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(21.0),
                      weight: FontWeight.bold
                  ),
                  buildWidgetText(
                      text: " - n°",
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(20.0)
                  ),
                  buildWidgetText(
                      text: player.number.toString(),
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(21.0),
                      weight: FontWeight.bold
                  )
                ]
            ),
          )
        ],
      ),

    );
  }
}
