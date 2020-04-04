import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';

import 'linear_chart.dart';

class _BoxLinearChartState extends State<BoxLinearChart> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
          color: CustomColors.BlackBackgroundChart,
          borderRadius: BorderRadius.circular(5)
      ),
      child: _buildCharts(),
    );
  }

  _buildCharts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.linearCharts,
    );
  }
}

class BoxLinearChart extends StatefulWidget {
  final List<LinearChart> linearCharts;
  const BoxLinearChart(this.linearCharts, {Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BoxLinearChartState();
}
