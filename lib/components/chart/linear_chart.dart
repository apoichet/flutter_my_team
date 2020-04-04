import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/number_service.dart';
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
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildTextHeader(),
              _joinTextHeader()
            ],
          ),
          RotatedBox(
            quarterTurns: 3,
            child: new LinearPercentIndicator(
              animationDuration: 1000,
              lineHeight: 12.0,
              width: widget.width,
              animation: true,
              percent: percent,
              progressColor: widget.color,
              linearGradient: widget.linearGradient,
              backgroundColor: widget.backgroundColor,
            ),
          ),
        ],

      ),
    );
  }

  AutoSizeText _buildTextHeader() {
    var text = roundDouble(widget.value, 1).toString();
    if (widget.rounded) {
      text = widget.value.round().toString();
    }
    return buildWidgetText(
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
        text: '/',
        family: FontFamily.ARIAL,
    );
  }

}
