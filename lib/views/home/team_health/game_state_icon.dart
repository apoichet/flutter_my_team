import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class GameStateIconState extends StatelessWidget {

  final Color color;
  final String letter;

  GameStateIconState({@required this.color, @required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 7, right: 7),
        width: getResponsiveHeight(30.0),
        height: getResponsiveHeight(30.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.8),
                blurRadius: 6,
                offset: Offset(
                  0.0, // horizontal, move right 10
                  4.0, // vertical, move down 10
                ),
              )
            ]
        ),
        child: buildWidgetText(
          fontSize: getResponsiveSize(19.0),
          text: letter,
          family: FontFamily.ARIAL,
          weight: FontWeight.bold,
        )
    );
  }

}

