import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/services/number_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

import 'linear_percent_indicator.dart';

class LinearChart extends StatelessWidget {

  final String footer;
  final double width;
  final Color color;
  final Color backgroundColor;
  final Color valueColor;
  final LinearGradient linearGradient;
  final double value;
  final double valueMax;
  final bool rounded;
  final bool last;
  final double headerFontSize;

  LinearChart(
      {Key key,
        @required this.width,
        @required this.backgroundColor,
        @required this.valueColor,
        this.color,
        this.value = 0.0,
        this.linearGradient,
        @required this.valueMax,
        this.rounded = true,
        this.last = false,
        this.footer = "",
        this.headerFontSize = 18.0
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percent = calcPercent(value, valueMax);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              _buildTextHeader(),
              _joinTextHeader()
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: getResponsiveHeight(8.0),
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: new LinearPercentIndicator(
                animationDuration: 1500,
                lineHeight: getResponsiveHeight(width),
                animation: true,
                percent: percent,
                progressColor: color,
                linearGradient: linearGradient,
                backgroundColor: backgroundColor,
              ),
            ),
          ),
        ),
      ],

    );
  }

  Widget _buildTextHeader() {
    var text = roundDouble(value, 1).toString();
    if (rounded) {
      text = value.round().toString();
    }
    return buildWidgetText(
        fontSize: getResponsiveWidth(headerFontSize),
        text: text,
        color: valueColor,
        family: FontFamily.ARIAL,
        weight: FontWeight.bold
    );
  }

  _joinTextHeader() {
    if(last) {
      return SizedBox.shrink();
    }
    return buildWidgetText(
      fontSize: getResponsiveWidth(headerFontSize - 5),
      text: '',
      family: FontFamily.ARIAL,
    );
  }

}
