import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/number_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

import 'circular_chart.dart';

class BoxCircularChart extends StatelessWidget {

  final List<CircularChart> circularCharts;
  final double fontHeaderSize;
  final double fontFooterSize;
  final bool withFooter;
  final double horizontalPadding;
  final double verticalPadding;
  final bool flex;

  const BoxCircularChart({
    this.circularCharts,
    this.fontHeaderSize = 25.0,
    this.fontFooterSize = 25.0,
    this.withFooter = false,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.flex = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.BlackBackgroundChart,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(horizontalPadding),
            vertical: getResponsiveHeight(verticalPadding)
        ),
        child: flex ? _buildFlex() : _buildNodFlex()
      ),
    );
  }

  Widget _buildNodFlex() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeader(),
        _buildCharts(),
        _buildFooter(),
      ],
    );
  }

  Widget _buildFlex() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: _buildHeader()
        ),
        Expanded(
            flex: 6,
            child: Center(child: _buildCharts())
        ),
        Expanded(
            flex: withFooter ? 2 : 0,
            child: _buildFooter()
        ),
      ],
    );
  }

  Widget _buildHeader() {
    List<Widget> texts = circularCharts.map((chart) =>
        _buildTextHeader(chart)).toList();
    return Padding(
      padding: EdgeInsets.only(
        top: getResponsiveHeight(8.0)
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: _joinTextWidgets(texts)
      ),
    );
  }

  Widget _buildTextHeader(CircularChart chart) {
    var text = roundDouble(chart.value, 1).toString();
    if (chart.rounded) {
      text = chart.value.round().toString();
    }
    return buildWidgetText(
        fontSize: getResponsiveWidth(fontHeaderSize),
        text: text,
        family: FontFamily.ARIAL,
        weight: FontWeight.bold,
        color: chart.valueColor
    );
  }

  List<Widget> _joinTextWidgets(List<Widget> texts) {
    var textsJoined = <Widget>[];
    for (var text in texts) {
      textsJoined.add(text);
      if (text != texts.last) {
        textsJoined.add(buildWidgetText(
          fontSize: getResponsiveWidth(fontHeaderSize - 5.0),
          text: ' ',
          family: FontFamily.ARIAL,
        ));
      }
    }
    return textsJoined;
  }

  Widget _buildCharts() {
    var charts = <Widget>[];
    for (var chart in circularCharts) {
      if (chart == circularCharts.first) {
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
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveWidth(8.0),
        vertical: getResponsiveHeight(3.0)
      ),
      child: FittedBox(
        child: Stack(
          children: charts,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    if (withFooter) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: circularCharts
            .map((chart) => buildWidgetText(
            text: chart.footer,
            fontSize: getResponsiveHeight(fontFooterSize),
            family: FontFamily.ARIAL,
            align: TextAlign.left,
            color: chart.valueColor,
            weight: FontWeight.bold
        )).toList(),
      );
    }
    return SizedBox.shrink();
  }

}
