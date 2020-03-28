import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class NextGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: buildWidgetText(
                      text: "Prochain Match",
                      family: FontFamily.ARIAL,
                      size: 18,
                      weight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: buildWidgetText(
                    text: "Nanterre le 02/03 à Balard",
                    family: FontFamily.ARIAL,
                    size: 14,
                  ),
                )
              ]
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset(
              'assets/icon/detail_icon.svg',
              fit: BoxFit.fill,
              semanticsLabel: 'Nav Bar Icon'),
        )
      ],
    );
  }

}
