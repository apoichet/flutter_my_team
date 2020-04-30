import 'package:flutter/widgets.dart';
import 'package:my_team/components/chart/box_circular_chart.dart';
import 'package:my_team/components/chart/box_linear_chart.dart';
import 'package:my_team/components/chart/circular_chart.dart';
import 'package:my_team/components/chart/linear_chart.dart';
import 'package:my_team/const/charts_size.dart';
import 'package:my_team/const/charts_title.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';


class HomeCharts extends StatelessWidget {

  final String pathImage = 'assets/img/player/';
  final Team team;
  final Player player;

  const HomeCharts({Key key, this.team, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getResponsiveHeight(8.0)
      ),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(8.0)),
                child: _buildCharts(),
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(8.0)),
                child: _buildFooterCharts(),
              )
          ),
        ],
      ),
    );
  }

  Widget _buildCharts() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Align(
                alignment: Alignment.bottomRight,
                child: BoxCircularChart(
                    circularCharts: [
                      _buildChartGoal(),
                      _buildChartPass()
                    ]
                )
            )
        ),
        Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(12.0)),
                child: BoxCircularChart(
                    circularCharts: [
                      _buildChartGame(),
                      _buildChartGameTime()
                    ]
                ),
              ),
            )
        ),
        Expanded(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: BoxLinearChart(
                    linearCharts: [
                      _buildChartMissing(),
                      _buildChartLate(),
                      _buildChartYellowCard()
                    ]
                )
            )
        ),
      ],
    );
  }

  Widget _buildFooterCharts() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: buildWidgetText(
              text: ChartsTitle.GOAL_CIRCULAR_TITLE + " /\n" + ChartsTitle.PASS_CIRCULAR_TITLE,
              family: FontFamily.ARIAL,
              fontSize: getResponsiveWidth(12.0)
          ),
        ),
        Expanded(
          flex: 2,
          child: buildWidgetText(
              text: ChartsTitle.GAME_PLAYED_TITLE + " /\n" + ChartsTitle.GAME_TIME_TITLE,
              family: FontFamily.ARIAL,
              fontSize: getResponsiveWidth(12.0)
          ),
        ),
        Expanded(
          child: buildWidgetText(
              text: ChartsTitle.MISSING_LINEAR_TITLE + " /\n" + ChartsTitle.LATE_LINEAR_TITLE + " / " + ChartsTitle.YELLOW_CARD_LINEAR_TITLE,
              family: FontFamily.ARIAL,
              fontSize: getResponsiveWidth(12.0)
          ),
        ),
      ],
    );
  }

  CircularChart _buildChartPass() {
    return CircularChart(
      width: getResponsiveHeight(ChartsSize.PASS_CIRCULAR_WIDTH),
      strokeWidth: getResponsiveHeight(ChartsSize.PASS_CIRCULAR_STROKE_WIDTH),
      value: player.nbrPass.toDouble(),
      valueMax: team.maxPlayerPass.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.RedTransparent,
      valueColor: CustomColors.RedGradientEnd,
      linearGradient: LinearGradient(
          colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
      ),
    );
  }

  CircularChart _buildChartGoal() {
    return CircularChart(
      width: getResponsiveHeight(ChartsSize.GOAL_CIRCULAR_WIDTH),
      strokeWidth: getResponsiveHeight(ChartsSize.GOAL_CIRCULAR_STROKE_WIDTH),
      value: player.nbrGoal.toDouble(),
      valueMax: team.maxPlayerGoal.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.OrangeTransparent,
      valueColor: CustomColors.OrangeGradientStart,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

  CircularChart _buildChartGameTime() {
    return CircularChart(
      width: getResponsiveHeight(ChartsSize.GAME_TIME_WIDTH),
      strokeWidth: getResponsiveHeight(ChartsSize.GAME_TIME_STROKE_WIDTH),
      value: player.gameTime.toDouble(),
      valueMax: team.maxPlayerGameTime.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.OrangeTransparent,
      valueColor: CustomColors.OrangeGradientStart,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

  CircularChart _buildChartGame() {
    return CircularChart(
      width: getResponsiveHeight(ChartsSize.GAME_PLAYED_WIDTH),
      strokeWidth: getResponsiveHeight(ChartsSize.GAME_PLAYED_STROKE_WIDTH),
      value: player.nbrGame.toDouble(),
      valueMax: team.maxPlayerGame.toDouble(),
      rounded: true,
      backgroundColor: CustomColors.RedTransparent,
      valueColor: CustomColors.RedGradientEnd,
      linearGradient: LinearGradient(
          colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
      ),
    );
  }

  LinearChart _buildChartYellowCard() {
    return LinearChart(
      valueColor: CustomColors.OrangeGradientStart,
      backgroundColor: CustomColors.OrangeTransparent,
      value: player.nbrYellowCard.toDouble(),
      valueMax: team.maxPlayerYellowCard.toDouble(),
      width: ChartsSize.YELLOW_CARD_LINEAR_WIDTH,
      last: true,
      linearGradient: LinearGradient(
          colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
      ),
    );
  }

  LinearChart _buildChartLate() {
    return LinearChart(
        valueColor: CustomColors.RedGradientEnd,
        backgroundColor: CustomColors.RedTransparent,
        value: player.nbrLateGame.toDouble(),
        valueMax: team.maxPlayerLateGame.toDouble(),
        width: ChartsSize.LATE_LINEAR_WIDTH,
        linearGradient: LinearGradient(
            colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
        ));
  }

  LinearChart _buildChartMissing() {
    return LinearChart(
        color: CustomColors.GreenApple,
        valueColor: CustomColors.GreenApple,
        backgroundColor: CustomColors.GreenAppleTransparent,
        value: player.nbrMissingGame.toDouble(),
        valueMax: team.maxPlayerMissingGame.toDouble(),
        width: ChartsSize.MISSING_LINEAR_WIDTH);
  }
}
