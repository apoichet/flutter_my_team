import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';

import 'circular_chart.dart';

class _BoxCircularChartState extends State<BoxCircularChart> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.BlackBackgroundChart,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeader(),
          _buildCharts()
        ],
      ),
    );
  }

  _buildHeader() {
    List<Text> texts = widget.circularCharts.map((chart) => _buildTextHeader(chart)).toList();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: _joinTextWidgets(texts)
    );
  }

  Text _buildTextHeader(CircularChart chart) {
    var text = roundDouble(chart.value, 1).toString();
    if (chart.rounded) {
      text = chart.value.round().toString();
    }
    return Text(text, style: _getChartNumberStyle(chart.valueColor));
  }

  _joinTextWidgets(List<Text> texts) {
    var textsJoined = <Widget>[];
    for (var text in texts) {
      textsJoined.add(text);
      if (text != texts.last) {
        textsJoined.add(Text('/', style: Theme.of(context).textTheme.subtitle));
      }
    }
    return textsJoined;
  }


  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  _buildCharts() {
    var charts = <Widget>[];
    for (var chart in widget.circularCharts) {
      if (chart == widget.circularCharts.first) {
        charts.add(
          chart
        );
      } else {
        charts.add(
            Positioned.fill(child: chart)
        );
      }
    }
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: charts,
      ),
    );
  }



  _getChartNumberStyle(color) {
    return TextStyle(
        color: color,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold,
        fontSize: 24
    );
  }

}

class BoxCircularChart extends StatefulWidget {
  final List<CircularChart> circularCharts;

  const BoxCircularChart({Key key, this.circularCharts}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoxCircularChartState();
}
