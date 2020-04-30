import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

import 'linear_chart.dart';

class BoxLinearChart extends StatelessWidget {

  final List<LinearChart> linearCharts;
  final bool withFooter;
  final double footerFontSize;

  const BoxLinearChart({
    this.linearCharts,
    this.withFooter = false,
    this.footerFontSize = 12.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: CustomColors.BlackBackgroundChart,
            borderRadius: BorderRadius.circular(10)
        ),
        //child: _buildFooter(),
        child: _build()
    );
  }

  _build() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: _buildCharts(),
        ),
        Expanded(
          flex: withFooter ? 2 : 0,
          child: _buildFooter(),
        )
      ],
    );
  }

  _buildCharts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: linearCharts,
    );
  }

  _buildFooter() {
    if (withFooter) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: linearCharts.map((chart) =>
            buildWidgetText(
                text: chart.footer,
                color: chart.valueColor,
                family: FontFamily.ARIAL,
                weight: FontWeight.bold,
                fontSize: getResponsiveHeight(footerFontSize)
            )).toList(),
      );
    }
    return SizedBox.shrink();
  }
}

