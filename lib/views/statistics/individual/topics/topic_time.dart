import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/chart/box_circular_chart.dart';
import 'package:my_team/components/chart/box_linear_chart.dart';
import 'package:my_team/components/chart/circular_chart.dart';
import 'package:my_team/components/chart/linear_chart.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/theme/colors.dart';

class TopicTime extends StatelessWidget {

  final Player player;

  TopicTime(this.player);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(15.0),
          vertical: getResponsiveHeight(5.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(10.0)),
                child: BoxCircularChart(
                  circularCharts: [_buildChartGame(), _buildChartGameTime()],
                  withFooter: true,
                  fontHeaderSize: 35.0,
                  fontFooterSize: 16.0,
                  verticalPadding: 5.0,
                  horizontalPadding: 8.0,
                  flex: true,
                ),
              )
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(5.0)),
                child: BoxLinearChart(
                  linearCharts: [
                    _buildChartStarted(),
                    _buildChartSubs(),
                    _buildChartMinutePerMatch(),
                  ],
                  withFooter: true,
                  footerFontSize: 13.0,
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _buildChartGame() {
    return CircularChart(
      footer: "Match Joués",
      width: getResponsiveHeight(125.0),
      strokeWidth: getResponsiveHeight(15.0),
      value: player.nbrGame.toDouble(),
      valueMax: getTeam().maxPlayerGame.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.OrangeTransparent,
      valueColor: CustomColors.OrangeGradientStart,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

  Widget _buildChartGameTime() {
    return CircularChart(
      footer: "Minutes Jouées",
      width: getResponsiveHeight(85.0),
      strokeWidth: getResponsiveHeight(15.0),
      value: player.gameTime.toDouble(),
      valueMax: getTeam().maxPlayerGameTime.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.RedTransparent,
      valueColor: CustomColors.RedGradientEnd,
      linearGradient: LinearGradient(
          colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
      ),
    );
  }

  Widget _buildChartStarted() {
    return LinearChart(
        rounded: true,
        headerFontSize: 24.0,
        footer: "Titulaires",
        color: CustomColors.GreenApple,
        valueColor: CustomColors.GreenApple,
        backgroundColor: CustomColors.GreenAppleTransparent,
        value: player.nbrStarter.toDouble(),
        valueMax: getTeam().maxPlayerStarter.toDouble(),
        width: getResponsiveHeight(getResponsiveWidth(110.0)));
  }

  LinearChart _buildChartSubs() {
    return LinearChart(
      rounded: true,
      headerFontSize: 24.0,
      footer: "Remplaçants",
      valueColor: CustomColors.OrangeGradientStart,
      backgroundColor: CustomColors.OrangeTransparent,
      value: player.nbrSubstitute.toDouble(),
      valueMax: getTeam().maxPlayerSubstitute.toDouble(),
      width: getResponsiveHeight(getResponsiveWidth(110.0)),
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

  Widget _buildChartMinutePerMatch() {
    return LinearChart(
        rounded: true,
        last: true,
        headerFontSize: 24.0,
        footer: "Minutes / Match",
        valueColor: CustomColors.RedGradientEnd,
        backgroundColor: CustomColors.RedTransparent,
        value: (player.gameTime / player.nbrGame),
        valueMax: getTeam().maxPlayerMinutePerMatch,
        width: getResponsiveHeight(getResponsiveWidth(110.0)),
        linearGradient: LinearGradient(
            colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
        ));
  }
}
