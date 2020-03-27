import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/number_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

import 'circular_chart.dart';


class BoxCircularChart extends StatefulWidget {
  final List<CircularChart> circularCharts;

  const BoxCircularChart(this.circularCharts, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoxCircularChartState();
}

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
    List<Text> texts = widget.circularCharts.map((chart) =>
        _buildTextHeader(chart)).toList();
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
    return buildWidgetText(
        text: text,
        family: FontFamily.ARIAL,
        weight: FontWeight.bold,
        size: 24,
        color: chart.valueColor
    );
  }

  _joinTextWidgets(List<Text> texts) {
    var textsJoined = <Widget>[];
    for (var text in texts) {
      textsJoined.add(text);
      if (text != texts.last) {
        textsJoined.add(buildWidgetText(
            text: '/',
            family: FontFamily.ARIAL,
            size: 15
        ));
      }
    }
    return textsJoined;
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

}
