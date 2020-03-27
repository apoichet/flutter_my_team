import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
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
          Image.asset(
              "assets/img/player/" + player.avatar + ".png",
              height: 40
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                children: <Widget>[
                  buildWidgetText(
                      text: player.firstName + " ",
                      family: FontFamily.ARIAL,
                      size: 20
                  ),
                  buildWidgetText(
                      text: player.lastName,
                      family: FontFamily.ARIAL,
                      size: 21,
                      weight: FontWeight.bold
                  ),
                  buildWidgetText(
                      text: " - n°",
                      family: FontFamily.ARIAL,
                      size: 20
                  ),
                  buildWidgetText(
                      text: player.number.toString(),
                      family: FontFamily.ARIAL,
                      size: 22,
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
