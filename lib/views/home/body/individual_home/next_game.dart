import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class NextGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }

}
