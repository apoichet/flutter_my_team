import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/results/matchs/result_match_item.dart';
import 'package:fc_parisii/services/responsive_size.dart';

class ResultMatch extends StatefulWidget {
  final String menuTitle1 = 'Matchs passés';
  final String menuTitle2 = 'Matchs à venir';

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
    _futureGames = getTeam().games.gameList.where((game) =>
        game.date.isAfter(DateTime.now().toLocal()))
        .toList().reversed.toList();
    _pastGames = getTeam().games.gameList.toSet()
        .difference(_futureGames.toSet())
        .toList().reversed.toList();
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
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.55)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildToggleTopic(widget.menuTitle1, _toggleLeft),
                _buildToggleTopic(widget.menuTitle2, !_toggleLeft)
              ],
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: _toggleLeft
              ? _buildMatchList(_pastGames)
              : _futureGames.isNotEmpty
              ? _buildMatchList(_futureGames)
              : _buildFinishSeason(),
        )
      ],
    );
  }

  Column _buildMatchList(List<Game> games) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: ListView(
              padding: EdgeInsets.all(0.0),
              controller: _controller,
              children: games.map((game) => ResultMatchItem(game: game)).toList()
          ),
        ),
        Expanded(
          child: _scrollIndicator,
        )
      ],
    );
  }

  _buildFinishSeason() {
    return Container(
      padding: EdgeInsets.only(
          bottom: getResponsiveHeight(30.0)
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Center(
              child: buildWidgetText(
                  text: "Pas de match en prévision !?",
                  color: Colors.white,
                  family: FontFamily.ARIAL,
                  weight: FontWeight.bold,
                  fontSize: getResponsiveHeight(20.0)
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Center(
              child: Image.asset("assets/img/no_more_games.gif")
            ),
          ),
        ],
      ),
    );
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
