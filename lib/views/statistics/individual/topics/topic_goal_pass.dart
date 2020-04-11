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

class TopicGoalPass extends StatelessWidget {

  final Player player;

  TopicGoalPass(this.player);

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
                padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(15.0)),
                child: BoxCircularChart(
                  circularCharts: [_buildChartGoal(), _buildChartPass()],
                  withFooter: true,
                  fontHeaderSize: 45.0,
                  fontFooterSize: 18.0,
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
                    _buildChartGoalPerMatch(),
                    _buildChartPassPerMatch(),
                    _buildChartDecisivePerMatch(),
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

  Widget _buildChartGoal() {
    return CircularChart(
      footer: "Buts",
      width: getResponsiveHeight(120.0),
      strokeWidth: getResponsiveHeight(15.0),
      value: player.nbrGoal.toDouble(),
      valueMax: getTeam().maxPlayerGoal.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.OrangeTransparent,
      valueColor: CustomColors.OrangeGradientStart,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

  Widget _buildChartPass() {
    return CircularChart(
      footer: "Passes",
      width: getResponsiveHeight(80.0),
      strokeWidth: getResponsiveHeight(15.0),
      value: player.nbrPass.toDouble(),
      valueMax: getTeam().maxPlayerPass.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.RedTransparent,
      valueColor: CustomColors.RedGradientEnd,
      linearGradient: LinearGradient(
          colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
      ),
    );
  }

  Widget _buildChartGoalPerMatch() {
    return LinearChart(
        rounded: false,
        headerFontSize: 18.0,
        footer: "Buts / Match",
        color: CustomColors.GreenApple,
        valueColor: CustomColors.GreenApple,
        backgroundColor: CustomColors.GreenAppleTransparent,
        value: player.nbrGoal / player.nbrGame,
        valueMax: getTeam().maxPlayerGoalPerMatch,
        width: 15.0);
  }

  Widget _buildChartPassPerMatch() {
    return LinearChart(
        rounded: false,
        headerFontSize: 18.0,
        footer: "Passes / Match",
        valueColor: CustomColors.RedGradientEnd,
        backgroundColor: CustomColors.RedTransparent,
        value: player.nbrPass / player.nbrGame,
        valueMax: getTeam().maxPlayerPassPerMatch,
        width: 15.0,
        linearGradient: LinearGradient(
            colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
        ));
  }

  LinearChart _buildChartDecisivePerMatch() {
    return LinearChart(
      rounded: false,
      headerFontSize: 18.0,
      footer: "Décisif / Match",
      valueColor: CustomColors.OrangeGradientStart,
      backgroundColor: CustomColors.OrangeTransparent,
      value: player.nbrGoal / player.nbrGame + player.nbrPass / player.nbrGame,
      valueMax: getTeam().maxPlayerDecisivePerMatch,
      width: 15.0,
      last: true,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

}
