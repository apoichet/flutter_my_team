import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/number_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

import 'linear_percent_indicator.dart';

class LinearChart extends StatefulWidget {
  final double width;
  final Color color;
  final Color backgroundColor;
  final Color valueColor;
  final LinearGradient linearGradient;
  final double value;
  final double valueMax;
  final bool rounded;
  final bool last;

  const LinearChart(
      {Key key,
        @required this.width,
        @required this.color,
        @required this.backgroundColor,
        @required this.valueColor,
        this.value = 0.0,
        this.linearGradient,
        @required this.valueMax,
        this.rounded = true,
        this.last = false,
      }
      ) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LinearChartState();
}


class _LinearChartState extends State<LinearChart> {

  double percent;

  @override
  void initState() {
    percent = calcPercent(widget.value, widget.valueMax);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          child: RotatedBox(
            quarterTurns: 3,
            child: new LinearPercentIndicator(
              animationDuration: 1000,
              lineHeight: getResponsiveWidth(15.0),
              animation: true,
              percent: percent,
              progressColor: widget.color,
              linearGradient: widget.linearGradient,
              backgroundColor: widget.backgroundColor,
            ),
          ),
        ),
      ],

    );
  }

  Widget _buildTextHeader() {
    var text = roundDouble(widget.value, 1).toString();
    if (widget.rounded) {
      text = widget.value.round().toString();
    }
    return buildWidgetText(
        fontSize: getResponsiveWidth(18.0),
        text: text,
        color: widget.valueColor,
        family: FontFamily.ARIAL,
        weight: FontWeight.bold
    );
  }

  _joinTextHeader() {
    if(widget.last) {
      return SizedBox.shrink();
    }
    return buildWidgetText(
      fontSize: getResponsiveWidth(12.0),
      text: '/',
      family: FontFamily.ARIAL,
    );
  }

}
