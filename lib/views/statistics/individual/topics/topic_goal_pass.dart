import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/chart/box_circular_chart.dart';
import 'package:my_team/components/chart/circular_chart.dart';
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
      //color: Colors.red,
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(0.0)),
                    child: BoxCircularChart(
                      circularCharts: [_buildChartGoal(), _buildChartPass()],
                      withFooter: true,
                      fontHeaderSize: 40.0,
                      fontFooterSize: 20.0,
                      verticalPadding: 5.0,
                      horizontalPadding: 8.0,
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 4,
                child: Text("")
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChartGoal() {
    return CircularChart(
      title: "Buts",
      width: getResponsiveHeight(120.0),
      strokeWidth: getResponsiveHeight(13.0),
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
      title: "Passes",
      width: getResponsiveHeight(80.0),
      strokeWidth: getResponsiveHeight(13.0),
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

}
