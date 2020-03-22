import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';

import 'linear_chart.dart';

class _BoxLinearChartState extends State<BoxLinearChart> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: CustomColors.BlackBackgroundChart,
          borderRadius: BorderRadius.circular(5)
      ),
      child: _buildCharts(),
    );
  }

  _buildCharts() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.linearCharts,
    );
  }
}

class BoxLinearChart extends StatefulWidget {
  final List<LinearChart> linearCharts;
  const BoxLinearChart({Key key, this.linearCharts}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BoxLinearChartState();
}
