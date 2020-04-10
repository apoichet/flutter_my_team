import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/chart/box_circular_chart.dart';
import 'package:my_team/components/chart/box_linear_chart.dart';
import 'package:my_team/components/chart/circular_chart.dart';
import 'package:my_team/components/chart/linear_chart.dart';
import 'package:my_team/components/player_avatar.dart';
import 'package:my_team/const/charts_size.dart';
import 'package:my_team/const/charts_title.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class IndividualCard extends StatefulWidget {
  static Team team = getTeam();

  final pathImage = 'assets/img/player/';
  final Player player = getPlayer();
  final int maxGoal = team.maxPlayerGoal;
  final int maxPass = team.maxPlayerPass;
  final int maxGame = team.maxPlayerGame;
  final int maxGameTime = team.maxPlayerGameTime;
  final int maxMissing = team.maxPlayerMissingGame;
  final int maxLate = team.maxPlayerLateGame;
  final int maxYellowCard = team.maxPlayerYellowCard;

  @override
  State<StatefulWidget> createState() => _IndividualCardState();
}

class _IndividualCardState extends State<IndividualCard> {

  CircularChart chartGoal;
  CircularChart chartPass;
  CircularChart chartGame;
  CircularChart chartGameTime;

  LinearChart chartMissing;
  LinearChart chartLate;
  LinearChart chartYellowCard;

  @override
  void initState() {
    chartPass = _buildChartPass();
    chartGame = _buildChartGame();
    chartGoal = _buildChartGoal();
    chartGameTime = _buildChartGameTime();
    chartMissing = _buildChartMissing();
    chartLate = _buildChartLate();
    chartYellowCard = _buildChartYellowCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: _buildHeader(context)
        ),
        Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(8.0)),
              child: _buildCharts(),
            )
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(8.0)),
              child: _buildFooterCharts(),
            )
        ),
        Expanded(
          flex: 1,
          child: _buildTapNameFooter(),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getResponsiveSize(8.0)),
      child: Row(
          children: <Widget>[
            PlayerAvatar(
              player: player,
              scale: 1.1,
              transform: Matrix4.translationValues(5, 5, 0),
              blurRadius: 6.0,
              yBlur: 3.0,
              shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: getResponsiveWidth(20.0),
                  right: getResponsiveWidth(5.0)
                ),
                child: buildWidgetText(
                    text: _buildTextHeader(),
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: getResponsiveSize(24.0)
                ),
              ),
            ),
          ]),
    );
  }

  _buildTextHeader() {
    String position = widget.player.position;
    String number = widget.player.number.toString();
    return position + " n°" + number;
  }

  Widget _buildCharts() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
                child: BoxCircularChart([chartGoal, chartPass])
            )
        ),
        Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(12.0)),
                child: BoxCircularChart([chartGame, chartGameTime]),
              ),
            )
        ),
        Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
                child: BoxLinearChart([chartMissing, chartLate, chartYellowCard])
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

  Widget _buildTapNameFooter() {
    return GestureDetector(
      onDoubleTap: _doubleTap,
      child: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.2,
                  color: Colors.white
              ),
              borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildWidgetText(
                fontSize: getResponsiveSize(21.0),
                text: player.firstName + " ",
                family: FontFamily.ARIAL,
              ),
              buildWidgetText(
                  fontSize: getResponsiveSize(21.0),
                  text: player.lastName,
                  family: FontFamily.ARIAL,
                  weight: FontWeight.bold
              )
            ],
          )
      ),
    );
  }

  _doubleTap() {
    setState(() {
      chartPass = _buildChartPass();
      chartGameTime = _buildChartGameTime();
      chartGoal = _buildChartGoal();
      chartGame = _buildChartGame();
      chartYellowCard = _buildChartYellowCard();
      chartLate = _buildChartLate();
      chartMissing = _buildChartMissing();
    });
  }

  CircularChart _buildChartPass() {
    return CircularChart(
      width: getResponsiveHeight(ChartsSize.PASS_CIRCULAR_WIDTH),
      strokeWidth: getResponsiveHeight(ChartsSize.PASS_CIRCULAR_STROKE_WIDTH),
      value: widget.player.nbrPass.toDouble(),
      valueMax: widget.maxPass.toDouble(),
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
      value: widget.player.nbrGoal.toDouble(),
      valueMax: widget.maxGoal.toDouble(),
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
      value: widget.player.gameTime.toDouble(),
      valueMax: widget.maxGameTime.toDouble(),
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
      value: widget.player.nbrGame.toDouble(),
      valueMax: widget.maxGame.toDouble(),
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
      value: widget.player.nbrYellowCard.toDouble(),
      valueMax: widget.maxYellowCard.toDouble(),
      width: getResponsiveHeight(ChartsSize.YELLOW_CARD_LINEAR_WIDTH),
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
        value: widget.player.nbrLateGame.toDouble(),
        valueMax: widget.maxLate.toDouble(),
        width: getResponsiveHeight(ChartsSize.LATE_LINEAR_WIDTH),
        linearGradient: LinearGradient(
            colors: [CustomColors.RedGradientStart, CustomColors.RedGradientEnd]
        ));
  }

  LinearChart _buildChartMissing() {
    return LinearChart(
        color: CustomColors.GreenApple,
        valueColor: CustomColors.GreenApple,
        backgroundColor: CustomColors.GreenAppleTransparent,
        value: widget.player.nbrMissingGame.toDouble(),
        valueMax: widget.maxMissing.toDouble(),
        width: getResponsiveHeight(ChartsSize.MISSING_LINEAR_WIDTH));
  }
}


