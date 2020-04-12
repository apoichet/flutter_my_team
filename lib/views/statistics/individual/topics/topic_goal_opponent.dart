import 'package:flutter/widgets.dart';
import 'package:my_team/components/chart/box_circular_chart.dart';
import 'package:my_team/components/chart/box_linear_chart.dart';
import 'package:my_team/components/chart/circular_chart.dart';
import 'package:my_team/components/chart/linear_chart.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/theme/colors.dart';

class TopicGoalOpponent extends StatelessWidget {

  final Player player;

  TopicGoalOpponent(this.player);

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
                  circularCharts: [_buildChartOpponentGoal(), _buildChartCleanSheet()],
                  withFooter: true,
                  fontHeaderSize: 45.0,
                  fontFooterSize: 15.0,
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
                    _buildChartGoalOpponentPerMatch(),
                    _buildChartGoalOpponentPenalty(),
                    _buildChartOpponentGoalCornerFreeKick(),
                  ],
                  withFooter: true,
                  footerFontSize: 10.0,
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _buildChartOpponentGoal() {
    return CircularChart(
      footer: "Buts Encaissés",
      width: getResponsiveHeight(120.0),
      strokeWidth: getResponsiveHeight(15.0),
      value: player.nbrGoalOpponent.toDouble(),
      valueMax: getTeam().maxPlayerGoalOpponent.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.OrangeTransparent,
      valueColor: CustomColors.OrangeGradientStart,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

  Widget _buildChartCleanSheet() {
    return CircularChart(
      footer: "Clean Sheets",
      width: getResponsiveHeight(80.0),
      strokeWidth: getResponsiveHeight(15.0),
      value: player.nbrCleanSheet.toDouble(),
      valueMax: getTeam().maxPlayerCleanSheet.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.RedTransparent,
      valueColor: CustomColors.RedGradientEnd,
      linearGradient: LinearGradient(
          colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
      ),
    );
  }

  Widget _buildChartGoalOpponentPerMatch() {
    return LinearChart(
        rounded: false,
        headerFontSize: 18.0,
        footer: "But Enc / Match",
        color: CustomColors.GreenApple,
        valueColor: CustomColors.GreenApple,
        backgroundColor: CustomColors.GreenAppleTransparent,
        value: player.nbrGoalOpponent / player.nbrGame,
        valueMax: getTeam().maxPlayerGoalOpponentPerMatch,
        width: 15.0);
  }

  Widget _buildChartGoalOpponentPenalty() {
    return LinearChart(
        rounded: true,
        headerFontSize: 18.0,
        footer: "Pénalty Enc",
        valueColor: CustomColors.RedGradientEnd,
        backgroundColor: CustomColors.RedTransparent,
        value: player.nbrOpponentGoalPenaltyCollected.toDouble(),
        valueMax: getTeam().maxPlayerOpponentGoalPenaltyCollected.toDouble(),
        width: 15.0,
        linearGradient: LinearGradient(
            colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
        ));
  }

  LinearChart _buildChartOpponentGoalCornerFreeKick() {
    return LinearChart(
      rounded: true,
      headerFontSize: 18.0,
      footer: "CF et Corner Enc",
      valueColor: CustomColors.OrangeGradientStart,
      backgroundColor: CustomColors.OrangeTransparent,
      value: player.nbrOpponentGoalCornerFreeKickCollected.toDouble(),
      valueMax: getTeam().maxPlayerOpponentGoalCornerFreeKickCollected.toDouble(),
      width: 15.0,
      last: true,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }
}
