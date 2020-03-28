import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/chart/box_circular_chart.dart';
import 'package:my_team/components/chart/box_linear_chart.dart';
import 'package:my_team/components/chart/circular_chart.dart';
import 'package:my_team/components/chart/linear_chart.dart';
import 'package:my_team/const/charts_size.dart';
import 'package:my_team/const/charts_title.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class IndividualCard extends StatefulWidget {
  static Team team = getTeam();

  final titleCard = 'Fiche individuelle';
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
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: _buildHeader(context)
        ),
        Expanded(
            flex: 5,
            child: FittedBox(
              child: _buildBody(),
            )
        ),
        Expanded(
          child: buildFooter(),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 15, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                    blurRadius: 6,
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      3.0, // vertical, move down 10
                    ),
                  )]
            ),
            child: Image.asset(
              "assets/img/player/" + player.avatar + ".png",
              filterQuality: FilterQuality.high,
              height: 105,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(20, 10, 0),
            child: buildWidgetText(
                text: widget.titleCard,
                family: FontFamily.ARIAL,
                weight: FontWeight.bold,
                size: 23
            ),
          ),
        ]);
  }


  Widget _buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _buildChart(
            BoxCircularChart([chartGoal, chartPass]),
            _buildFooter(ChartsTitle.GOAL_CIRCULAR_TITLE + ' /\n' +
                ChartsTitle.PASS_CIRCULAR_TITLE)
        ),
        _buildChart(
            BoxCircularChart([chartGame, chartGameTime]),
            _buildFooter(ChartsTitle.GAME_PLAYED_TITLE + ' /\n' +
                ChartsTitle.GAME_TIME_TITLE)
        ),
        _buildChart(
          BoxLinearChart([chartMissing, chartLate, chartYellowCard]),
          _buildFooter(ChartsTitle.MISSING_LINEAR_TITLE + ' /\n' +
              ChartsTitle.LATE_LINEAR_TITLE + ' / ' +
              ChartsTitle.YELLOW_CARD_LINEAR_TITLE),
        ),
      ],
    );
  }

  Widget buildFooter() {
    return GestureDetector(
      onDoubleTap: _doubleTap,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.2,
                  color: Colors.white
              ),
              borderRadius: BorderRadius.circular(50)
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Row(
              children: <Widget>[
                buildWidgetText(
                    text: player.firstName + " ",
                    family: FontFamily.ARIAL,
                    size: 21
                ),
                buildWidgetText(
                    text: player.lastName,
                    family: FontFamily.ARIAL,
                    size: 21,
                    weight: FontWeight.bold
                )
              ],
            ),
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

  Widget _buildChart(Widget chart, Widget footer) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          chart,
          footer,
        ],
      ),
    );
  }

  CircularChart _buildChartPass() {
    return CircularChart(
      width: ChartsSize.PASS_CIRCULAR_WIDTH,
      strokeWidth: ChartsSize.PASS_CIRCULAR_STROKE_WIDTH,
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
      width: ChartsSize.GOAL_CIRCULAR_WIDTH,
      strokeWidth: ChartsSize.GOAL_CIRCULAR_STROKE_WIDTH,
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
      width: ChartsSize.GAME_TIME_WIDTH,
      strokeWidth: ChartsSize.GAME_TIME_STROKE_WIDTH,
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
      width: ChartsSize.GAME_PLAYED_WIDTH,
      strokeWidth: ChartsSize.GAME_PLAYED_STROKE_WIDTH,
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
        value: widget.player.nbrLateGame.toDouble(),
        valueMax: widget.maxLate.toDouble(),
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
        value: widget.player.nbrMissingGame.toDouble(),
        valueMax: widget.maxMissing.toDouble(),
        width: ChartsSize.MISSING_LINEAR_WIDTH);
  }

  _buildFooter(String footer) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: buildWidgetText(
          text: footer,
          family: FontFamily.ARIAL,
          size: 12
      ),
    );
  }
}


