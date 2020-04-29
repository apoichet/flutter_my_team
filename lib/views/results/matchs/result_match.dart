import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/results/matchs/result_match_item.dart';

class ResultMatch extends StatefulWidget {
  @override
  _ResultMatchState createState() => _ResultMatchState();
}

class _ResultMatchState extends State<ResultMatch> {

  bool _toggleLeft;
  ScrollController _controller;
  Widget _scrollIndicator;
  List<Game> _pastGames;
  List<Game> _futureGames;

  @override
  void initState() {
    _toggleLeft = true;
    _controller =  ScrollController();
    _controller.addListener(_endScroll);
    _scrollIndicator = Image.asset("assets/img/arrow_down.png");
    _futureGames = getTeam().games.where((game) =>
        game.date.isAfter(DateTime.now().toLocal()))
        .toList().reversed.toList();
    _pastGames = getTeam().games.toSet()
        .difference(_futureGames.toSet())
        .toList().reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.55)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildToggleTopic("Matchs passés", _toggleLeft),
                _buildToggleTopic("Match à venir", !_toggleLeft)
              ],
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: ListView(
                    padding: EdgeInsets.all(0.0),
                    controller: _controller,
                    children: _toggleLeft ?
                    _buildResultMatchList(_pastGames) :
                    _buildResultMatchList(_futureGames)
                ),
              ),
              Expanded(
                child: _scrollIndicator,
              )
            ],
          ),
        )
      ],
    );
  }

  _buildResultMatchList(List<Game> games) {
    return games.map((game) => ResultMatchItem(game: game)).toList();
  }

  _buildToggleTopic(String topic, bool conditionToggle) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(!conditionToggle) {
            _toggleLeft = !_toggleLeft;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(12.0),
            vertical: getResponsiveHeight(5.0)
        ),
        decoration: BoxDecoration(
            color: conditionToggle ? Color.fromRGBO(10, 39, 76, 1.0) :
            Colors.transparent,
            borderRadius: BorderRadius.circular(50.0)
        ),
        child: buildWidgetText(
          text: topic,
          color: Colors.white,
          fontSize: getResponsiveWidth(20.0),
          family: FontFamily.ARIAL,
        ),
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
