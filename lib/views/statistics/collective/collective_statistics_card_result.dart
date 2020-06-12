import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/player_avatar.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/statistics/collective/collective_statistics_result.dart';
import 'package:fc_parisii/views/statistics/individual/individual_statistics.dart';

class CollectiveStatisticsCardResult extends StatefulWidget {

  final List<CollectiveStatisticsResult> podiumResults;
  final List<CollectiveStatisticsResult> restResults;
  final String unit;

  CollectiveStatisticsCardResult({
    @required this.podiumResults,
    @required this.restResults,
    this.unit
  });

  @override
  _CollectiveStatisticsCardResultState createState() => _CollectiveStatisticsCardResultState();
}

class _CollectiveStatisticsCardResultState extends State<CollectiveStatisticsCardResult> {

  ScrollController _controller;
  Widget _scrollIndicator;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_endScroll);
    _scrollIndicator = Image.asset("assets/img/arrow_down.png");
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getResponsiveWidth(5.0),
              vertical: getResponsiveHeight(5.0),
            ),
            child: _buildPodium(widget.podiumResults),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 8,
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    controller: _controller,
                    padding: EdgeInsets.symmetric(
                        vertical: getResponsiveHeight(5.0),
                        horizontal: getResponsiveWidth(8.0)
                    ),
                    children: widget.restResults.map((player) =>
                        _buildResultLine(player)
                    ).toList(),
                  )
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: getResponsiveHeight(13.0)),
                  child: _scrollIndicator,
                ),
              )
            ],

          ),
        ),
      ],
    );
  }

  Widget _buildPodium(List<CollectiveStatisticsResult> podiumResults) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: _buildPodiumImageResults(podiumResults),
        ),
        Expanded(
          flex: 3,
          child: _buildPodiumResults(podiumResults),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getResponsiveWidth(10.0)
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2.5,
                        color: Colors.white
                    )
                )
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPodiumImageResults(List<CollectiveStatisticsResult> podiumResults) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () => _goToPlayerStats(podiumResults[1].player),
            child: PlayerAvatar(
                scale: 0.75,
                player: podiumResults[1].player,
                blurRadius: 6.0,
                yBlur: 3.0,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () => _goToPlayerStats(podiumResults[0].player),
            child: PlayerAvatar(
                scale: 0.9,
                player: podiumResults[0].player,
                blurRadius: 6.0,
                yBlur: 3.0,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () => _goToPlayerStats(podiumResults[2].player),
            child: PlayerAvatar(
                scale: 0.75,
                player: podiumResults[2].player,
                blurRadius: 6.0,
                yBlur: 3.0,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPodiumResults(List<CollectiveStatisticsResult> podiumResults) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: _buildPodiumResult(
                result: podiumResults[1],
                nameFontSize: getResponsiveHeight(13.0),
                valueFontSize: getResponsiveHeight(16.0)
            )
        ),
        Expanded(
            flex: 3,
            child: _buildPodiumResult(
                result: podiumResults[0],
                nameFontSize: getResponsiveHeight(14.0),
                valueFontSize: getResponsiveHeight(18.0)
            )
        ),
        Expanded(
            flex: 2,
            child: _buildPodiumResult(
                result: podiumResults[2],
                nameFontSize: getResponsiveHeight(13.0),
                valueFontSize: getResponsiveHeight(16.0)
            )
        )
      ],
    );
  }

  Widget _buildPodiumResult({CollectiveStatisticsResult result,
    double nameFontSize, double valueFontSize}) {
    return GestureDetector(
      onTap: () => _goToPlayerStats(result.player),
      child: Column(
        children: <Widget>[
          Expanded(
            child: _buildPodiumResultText(
                result.player.firstName + " " + result.player.lastName.substring(0,1) + ".",
                nameFontSize),
          ),
          Expanded(
            child: _buildPodiumResultText(result.valueStr, valueFontSize),
          )
        ],
      ),
    );
  }

  Widget _buildPodiumResultText(String text, double fontSize) {
    return buildWidgetText(
        text: text,
        family: FontFamily.ARIAL,
        weight: FontWeight.bold,
        fontSize: fontSize
    );
  }

  Widget _buildResultLine(CollectiveStatisticsResult result) {
    return GestureDetector(
      onTap: () => _goToPlayerStats(result.player),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(3.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: getResponsiveHeight(30.0),
                child: PlayerAvatar(
                    player: result.player,
                    blurRadius: 6.0,
                    yBlur: 3.0,
                    shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: result.player.firstName + " " + result.player.lastName,
                      family: FontFamily.ARIAL,
                      weight: FontWeight.bold,
                      fontSize: getResponsiveWidth(15.0)
                  ),
                )
            ),
            Expanded(
                flex: 3,
                child: buildWidgetText(
                    text: result.valueStr,
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: getResponsiveWidth(18.0)
                )
            )
          ],
        ),
      ),
    );
  }

  void _endScroll() {
    setState(() {
      if(_controller.offset >= _controller.position.maxScrollExtent) {
        _scrollIndicator = SizedBox.shrink();
      }
      else {
        _scrollIndicator = Image.asset("assets/img/arrow_down.png");
      }
    });
  }

  void _goToPlayerStats(Player player) {
    Navigator.of(context).push(buildNoAnimationRoute(IndividualStatistics(player)));
  }
}
