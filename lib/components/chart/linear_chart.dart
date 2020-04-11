import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/number_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

import 'linear_percent_indicator.dart';

class LinearChart extends StatefulWidget {
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

  const LinearChart(
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
        fontSize: getResponsiveWidth(widget.headerFontSize),
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
      fontSize: getResponsiveWidth(widget.headerFontSize - 5),
      text: '/',
      family: FontFamily.ARIAL,
    );
  }

}
