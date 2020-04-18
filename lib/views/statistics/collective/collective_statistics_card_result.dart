import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/statistics/collective/collective_statistics_result.dart';

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
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getResponsiveWidth(5.0)
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
                  padding: EdgeInsets.symmetric(vertical: getResponsiveHeight(10.0)),
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
          flex: 6,
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Transform.scale(
            scale: 0.75,
            child: Image.asset(
              "assets/img/player/avatar" + ".png",
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Transform.scale(
            scale: 0.9,
            child: Image.asset(
              "assets/img/player/avatar" + ".png",
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Transform.scale(
            scale: 0.75,
            child: Image.asset(
              "assets/img/player/avatar" + ".png",
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
                nameFontSize: 12.0,
                valueFontSize: 12.0
            )
        ),
        Expanded(
            flex: 3,
            child: _buildPodiumResult(
                result: podiumResults[0],
                nameFontSize: 14.0,
                valueFontSize: 14.0
            )
        ),
        Expanded(
            flex: 2,
            child: _buildPodiumResult(
                result: podiumResults[2],
                nameFontSize: 12.0,
                valueFontSize: 12.0
            )
        )
      ],
    );
  }

  Widget _buildPodiumResult({CollectiveStatisticsResult result,
    double nameFontSize, double valueFontSize}) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _buildPodiumResultText(result.name, nameFontSize),
        ),
        Expanded(
          child: _buildPodiumResultText(result.valueStr, valueFontSize),
        )
      ],
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getResponsiveHeight(3.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/img/player/avatar" + ".png",
              height: 30,
            ),
          ),
          Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.centerLeft,
                child: buildWidgetText(
                    text: result.name,
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: 14.0
                ),
              )
          ),
          Expanded(
              flex: 3,
              child: buildWidgetText(
                  text: result.valueStr,
                  family: FontFamily.ARIAL,
                  weight: FontWeight.bold,
                  fontSize: 15.0
              )
          )
        ],

      ),
    );
  }

  _endScroll() {
    setState(() {
      if(_controller.offset >= _controller.position.maxScrollExtent) {
        _scrollIndicator = SizedBox.shrink();
      }
      else {
        _scrollIndicator = Image.asset("assets/img/arrow_down.png");
      }
    });
  }
}
