import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'circular_percent_indicator.dart';

class _CircularChartState extends State<CircularChart> {

  double percent;

  @override
  void initState() {
    percent = _calculPercent();
    super.initState();
  }
  @override
  void didUpdateWidget(CircularChart oldWidget) {
    percent = _calculPercent();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      animationDuration: 1000,
      arcType: ArcType.FULL,
      radius: widget.width,
      lineWidth: widget.strokeWidth,
      percent: percent,
      progressColor: widget.color,
      backgroundColor: widget.backgroundColor,
    );
  }

  _calculPercent() {
    var percent = widget.value / widget.valueMax;
    if(percent.isNaN) {
      return 0.0;
    }
    return percent;
  }
}

class CircularChart extends StatefulWidget {
  final double width;
  final double strokeWidth;
  final Color color;
  final Color backgroundColor;
  final double value;
  final double valueMax;
  final bool rounded;

  const CircularChart(
      {Key key,
        @required this.width,
        @required this.strokeWidth,
        @required this.color,
        @required this.backgroundColor,
        this.value = 0.0,
        @required this.valueMax,
        this.rounded = true
      }
      ) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CircularChartState();
}
