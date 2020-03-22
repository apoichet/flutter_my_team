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
import 'package:my_team/theme/colors.dart';

class _IndividualCardState extends State<IndividualCard> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(3),
      width: size.width * 0.9,
      alignment: Alignment.center,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: CustomColors.IndividualCardContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: _buildHeader(context)
          ),
          Expanded(
              flex: 5,
              child: FittedBox(
                child: buildBody(),
              )
          ),
          Expanded(
            child: buildFooter(size, context),
          ),
        ],
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(3),
              child: Image.asset(
                  widget.pathImage + widget.player.avatar + '.'
                      + widget.definitionImage
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.titleCard,
                      style: Theme.of(context).textTheme.caption),
                )
            ),
          ),
        ]);
  }

  Row buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildChart(
            _buildGoalPassCircularCharts(),
            _buildFooter(ChartsTitle.GOAL_CIRCULAR_TITLE + ' /\n' +
                ChartsTitle.PASS_CIRCULAR_TITLE)
        ),
        _buildChart(
            _buildGameTimeCircularCharts(),
            _buildFooter(ChartsTitle.GAME_PLAYED_TITLE + ' /\n' +
                ChartsTitle.GAME_TIME_TITLE)
        ),
        _buildChart(
          _buildMissingLateCardLinearCharts(),
          _buildFooter(ChartsTitle.MISSING_LINEAR_TITLE + ' /\n' +
              ChartsTitle.LATE_LINEAR_TITLE + ' / ' +
              ChartsTitle.YELLOW_CARD_LINEAR_TITLE),
        ),
      ],
    );
  }

  Widget buildFooter(Size size, BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        width: size.width * 0.8,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.2,
                color: Colors.white
            ),
            borderRadius: BorderRadius.circular(50)
        ),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Text(
                widget.player.firstName + " " + widget.player.lastName,
                style: Theme.of(context).textTheme.caption),
          ),
        )
    );
  }

  Widget _buildChart(Widget chart, Widget footer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          chart,
          footer,
        ],
      ),
    );
  }

  BoxCircularChart _buildGoalPassCircularCharts() {
    return BoxCircularChart(
        circularCharts: [
          _buildCircularGoalChart(),
          _buildCircularPassChart()
        ]
    );
  }

  BoxCircularChart _buildGameTimeCircularCharts() {
    return BoxCircularChart(
        circularCharts: [
          _buildCircularGameChart(),
          _buildCircularGameTimeChart()
        ]
    );
  }

  BoxLinearChart _buildMissingLateCardLinearCharts() {
    return BoxLinearChart(
      linearCharts:
      [
        _buildLinearMissingChart(),
        _buildLinearLateChart(),
        _buildLinearYellowCardChart()
      ],
    );
  }

  CircularChart _buildCircularPassChart() {
    return CircularChart(
      width: ChartsSize.PASS_CIRCULAR_WIDTH,
      strokeWidth: ChartsSize.PASS_CIRCULAR_STROKE_WIDTH,
      value: widget.player.nbrPass.toDouble(),
      valueMax: widget.maxPass.toDouble(),
      rounded: true,
      color: CustomColors.PinkChart,
      backgroundColor: CustomColors.PinkChartTransparent,
    );
  }

  CircularChart _buildCircularGoalChart() {
    return CircularChart(
      width: ChartsSize.GOAL_CIRCULAR_WIDTH,
      strokeWidth: ChartsSize.GOAL_CIRCULAR_STROKE_WIDTH,
      value: widget.player.nbrGoal.toDouble(),
      valueMax: widget.maxGoal.toDouble(),
      rounded: true,
      color: CustomColors.BlueChart,
      backgroundColor: CustomColors.BlueChartTransparent,
    );
  }

  CircularChart _buildCircularGameTimeChart() {
    return CircularChart(
      width: ChartsSize.GAME_TIME_WIDTH,
      strokeWidth: ChartsSize.GAME_TIME_STROKE_WIDTH,
      value: widget.player.gameTime.toDouble(),
      valueMax: widget.maxGameTime.toDouble(),
      rounded: true,
      color: CustomColors.GreenChart,
      backgroundColor: CustomColors.GreenChartTransparent,
    );
  }

  CircularChart _buildCircularGameChart() {
    return CircularChart(
      width: ChartsSize.GAME_PLAYED_WIDTH,
      strokeWidth: ChartsSize.GAME_PLAYED_STROKE_WIDTH,
      value: widget.player.nbrGame.toDouble(),
      valueMax: widget.maxGame.toDouble(),
      rounded: true,
      color: CustomColors.PinkChart,
      backgroundColor: CustomColors.PinkChartTransparent,
    );
  }

  LinearChart _buildLinearYellowCardChart() {
    return LinearChart(
      color: CustomColors.BlueChart,
      backgroundColor: CustomColors.BlueChartTransparent,
      value: widget.player.nbrYellowCard.toDouble(),
      valueMax: widget.maxYellowCard.toDouble(),
      width: ChartsSize.YELLOW_CARD_LINEAR_WIDTH,
      last: true,
    );
  }

  LinearChart _buildLinearLateChart() {
    return LinearChart(
        color: CustomColors.PinkChart,
        backgroundColor: CustomColors.PinkChartTransparent,
        value: widget.player.nbrLateGame.toDouble(),
        valueMax: widget.maxLate.toDouble(),
        width: ChartsSize.LATE_LINEAR_WIDTH);
  }

  LinearChart _buildLinearMissingChart() {
    return LinearChart(
        color: CustomColors.GreenChart,
        backgroundColor: CustomColors.GreenChartTransparent,
        value: widget.player.nbrMissingGame.toDouble(),
        valueMax: widget.maxMissing.toDouble(),
        width: ChartsSize.MISSING_LINEAR_WIDTH);
  }

  _buildFooter(String footer) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(footer,
          textAlign: TextAlign.center,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.body2),
    );
  }
}

class IndividualCard extends StatefulWidget {
  final titleCard = 'FIche Individuelle';
  final pathImage = 'assets/img/';
  final definitionImage = 'png';

  final Player player;
  final int maxGoal;
  final int maxPass;
  final int maxGame;
  final int maxGameTime;
  final int maxMissing;
  final int maxLate;
  final int maxYellowCard;

  IndividualCard({
      this.player,
      this.maxGoal = 0,
      this.maxPass = 0,
      this.maxGame = 0,
      this.maxGameTime = 0,
      this.maxMissing = 0,
      this.maxLate = 0,
      this.maxYellowCard = 0});

  @override
  State<StatefulWidget> createState() => _IndividualCardState();
}
