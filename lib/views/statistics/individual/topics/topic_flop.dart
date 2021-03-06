import 'package:fc_parisii/services/number_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/chart/linear_percent_indicator.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/colors.dart';
import 'package:fc_parisii/theme/font_family.dart';

class TopicFlop extends StatelessWidget {
  final Player player;

  TopicFlop(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getResponsiveSize(10.0)),
      child: Container(
        padding: EdgeInsets.all(getResponsiveSize(10.0)),
        decoration: BoxDecoration(
            color: CustomColors.BlackBackgroundChart,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: _buildLinearChart(
                    title: "Cartons Jaunes",
                    value: player.nbrYellowCard,
                    valueMax: getTeam().maxPlayerYellowCard,
                    color: CustomColors.OrangeGradientStart,
                    linearGradient: LinearGradient(
                        colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
                    )
                )
            ),
            Expanded(
                child: _buildLinearChart(
                    title: "Minutes de Retard",
                    value: player.lateTime,
                    valueMax: getTeam().maxPlayerLateTime,
                    color: CustomColors.RedGradientEnd,
                    linearGradient: LinearGradient(
                        colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
                    )
                )
            ),
            Expanded(
                child: _buildLinearChart(
                  title: "Absents",
                  value: player.nbrAbsent,
                  valueMax: getTeam().maxPlayerAbsent,
                  color: Color.fromRGBO(0, 191, 255, 1.0),
                )
            ),
            Expanded(
                child: _buildLinearChart(
                    title: "Mises au Repos",
                    value: player.nbrRest,
                    valueMax: getTeam().maxPlayerRest,
                    color: CustomColors.GreenApple
                )
            ),
            Expanded(
                child: _buildLinearChart(
                    title: "Semaines Blessé",
                    value: player.nbrHurt,
                    valueMax: getTeam().maxPlayerHurt,
                    color: CustomColors.OrangeGradientEnd,
                    linearGradient: LinearGradient(
                        colors: [CustomColors.OrangeGradientStart, CustomColors.OrangeGradientEnd]
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

  _buildLinearChart({String title, int value, int valueMax, Color color, LinearGradient linearGradient}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: buildWidgetText(
                fontSize: getResponsiveWidth(30.0),
                family: FontFamily.ARIAL,
                weight: FontWeight.bold,
                color: color,
                text: title
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 7,
                    child: LinearPercentIndicator(
                      animationDuration: 1000,
                      progressColor: linearGradient != null ? null : color,
                      lineHeight: 15.0,
                      animation: true,
                      backgroundColor: color.withOpacity(0.3),
                      percent: calcPercent(value.toDouble(), valueMax.toDouble()),
                      linearGradient: linearGradient,
                    )
                ),
                Expanded(
                    flex: 3,
                    child: buildWidgetText(
                        fontSize: getResponsiveSize(30.0),
                        family: FontFamily.ARIAL,
                        weight: FontWeight.bold,
                        color: color,
                        text: value.toString())
                )
              ],
            )
        )
      ],
    );
  }
}
