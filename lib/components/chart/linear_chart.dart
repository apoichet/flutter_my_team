import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'linear_percent_indicator.dart';

class _LinearChartState extends State<LinearChart> {

  double percent;

  @override
  void initState() {
    percent = _calculPercent();
    super.initState();
  }

  @override
  void didUpdateWidget(LinearChart oldWidget) {
    percent = _calculPercent();
    super.didUpdateWidget(oldWidget);
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
              backgroundColor: widget.backgroundColor,
            ),
          ),
        ],

      ),
    );
  }

  Text _buildTextHeader() {
    var text = roundDouble(widget.value, 1).toString();
    if (widget.rounded) {
      text = widget.value.round().toString();
    }
    return Text(text, style: _getChartNumberStyle(widget.color));
  }

  _joinTextHeader() {
    if(widget.last) {
      return Text('');
    }
    return Text('/', style: Theme.of(context).textTheme.subtitle);
  }


  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  _getChartNumberStyle(color) {
    return TextStyle(
        color: color,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold,
        fontSize: 24
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

class LinearChart extends StatefulWidget {
  final double width;
  final Color color;
  final Color backgroundColor;
  final double value;
  final double valueMax;
  final bool rounded;
  final bool last;

  const LinearChart(
      {Key key,
        @required this.width,
        @required this.color,
        @required this.backgroundColor,
        this.value = 0.0,
        @required this.valueMax,
        this.rounded = true,
        this.last = false,
      }
      ) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LinearChartState();
}
