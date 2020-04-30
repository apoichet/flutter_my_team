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
            child: _buildRow("Nom : ", player.nickName, false)
        ),
        Expanded(
            child: _buildRow("Poste : ", player.position, false),
        ),
        Expanded(
            child: _buildRow("Numéro :", player.number.toString(), true)
        ),
      ],
    );
  }

  _buildRow(String first, String second, bool isNumber) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: buildWidgetText(
              align: TextAlign.left,
              text: first,
              fontSize: getResponsiveWidth(fontSize - 4),
              family: FontFamily.ARIAL,
              fontStyle: FontStyle.italic,
              color: Colors.white.withOpacity(0.8)
          ),
        ),
        Expanded(
          flex: 6,
          child: buildWidgetText(
              align: isNumber ? TextAlign.center : TextAlign.left,
              text: second,
              fontSize: getResponsiveWidth(isNumber ? fontSize + 4 : fontSize),
              family: FontFamily.ARIAL,
              weight: FontWeight.bold,
              color: Colors.white
          ),
        ),

      ],
    );
  }

}
