import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/domain/game_composition_player.dart';
import 'package:my_team/domain/game_type.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/text_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/results/matchs/result_match_player_details.dart';

class ResultMatchDetailsCard extends StatefulWidget {

  final Game game;

  ResultMatchDetailsCard(this.game);

  @override
  _ResultMatchDetailsCardState createState() => _ResultMatchDetailsCardState();
}

class _ResultMatchDetailsCardState extends State<ResultMatchDetailsCard> {
  final String _teamName = "FC Parisii";
  final Color _colorOpponentTeam = Color.fromRGBO(25, 14, 150, 1);
  final Color _colorTeam = Colors.black;

  String _scoreFirstMatch;
  List<GameCompositionPlayer> _gamePlayers;

  @override
  void initState() {
    _scoreFirstMatch = _findFirstMatchScore();
    _gamePlayers = widget.game.gameCompositionPlayers
        .where((player) => player.nbGoal != 0 || player.nbYellowCard != 0)
        .toList();
    _gamePlayers.sort((g1, g2) {
      if (g2.nbGoal == g1.nbGoal) {
        return g2.nbYellowCard.compareTo(g1.nbYellowCard);
      }
      return g2.nbGoal.compareTo(g1.nbGoal);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: _buildHeaderScore()
              ),
              Expanded(
                  flex: 7,
                  child: _getDetails()
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDetails() {
    return widget.game.gameCompositionPlayers.isEmpty ? _buildStadiumAddress() : _buildPlayerListView();
  }

  Widget _buildStadiumAddress() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveWidth(25.0),
        vertical: getResponsiveHeight(35.0)
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveWidth(3.0),
              vertical: getResponsiveHeight(5.0)
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Row(
            children: <Widget> [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getResponsiveWidth(15.0),
                      vertical: getResponsiveHeight(5.0)
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildWidgetText(
                              text: "Stade " + widget.game.stadium,
                              family: FontFamily.ARIAL,
                              color: Colors.white,
                              weight: FontWeight.bold,
                              fontSize: getResponsiveSize(25.0)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildWidgetText(
                              text: widget.game.address,
                              family: FontFamily.ARIAL,
                              color: Colors.white,
                              fontSize: getResponsiveSize(18.0)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: SvgPicture.asset(
                      'assets/icon/detail_icon.svg',
                      fit: BoxFit.fill,
                      width: getResponsiveWidth(28.0),
                      height: getResponsiveHeight(28.0),
                      semanticsLabel: 'Nav Bar Icon'),
                ),
              )
          ]),
        ),
      ),
    );
  }

  _buildPlayerListView() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 0.2,
        color: Colors.white.withOpacity(0.2),
      ),
      padding: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(7.0),
          horizontal: getResponsiveWidth(3.0)
      ),
      itemCount: _gamePlayers.length,
      itemBuilder: (BuildContext context, int index) => ResultMatchPlayerDetails(_gamePlayers[index]),
    );
  }

  _buildHeaderScore() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: _buildTeamCard(true,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)
                  )
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Color.fromRGBO(119, 135, 155, 1),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveWidth(3.0),
                    vertical: getResponsiveHeight(3.0),
                  ),
                  child:
                  _scoreFirstMatch == "" ?
                  Center(
                      child: buildWidgetText(
                          text: _getScoreMatch(),
                          family: FontFamily.ARIAL,
                          weight: FontWeight.bold,
                          fontSize: getResponsiveSize(28.0)
                      )) :
                  Column(
                      children: <Widget>[
                        Expanded(
                            flex: 6,
                            child: Center(
                              child: buildWidgetText(
                                  text: _getScoreMatch(),
                                  family: FontFamily.ARIAL,
                                  weight: FontWeight.bold,
                                  fontSize: getResponsiveSize(25.0)
                              ),
                            )
                        ),
                        Expanded(
                            flex: 4,
                            child: Center(
                              child: buildWidgetText(
                                  text: _scoreFirstMatch,
                                  family: FontFamily.ARIAL,
                                  weight: FontWeight.bold,
                                  fontSize: getResponsiveSize(25.0)
                              ),
                            )
                        ),
                      ]
                  ),
                ),
              )
          ),
          Expanded(
              flex: 4,
              child: _buildTeamCard(false,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20)
                  )
              )
          )
        ],
      ),
    );
  }

  String _getScoreMatch() {
    return isNullOrEmpty(widget.game.score) ? "VS" : widget.game.score;
  }

  String _findFirstMatchScore() {
    if (widget.game.type == GameType.CHAMPIONSHIP) {
      Game firstMatch = getTeam().games
          .singleWhere((g) =>
      g.type == GameType.CHAMPIONSHIP &&
          g.opponent == widget.game.opponent &&
          g.date.isBefore(widget.game.date), orElse: () => null);
      if (firstMatch != null) {
        return "(aller : " + firstMatch.reverseScore() + ")";
      }
    }
    return "";
  }

  _buildTeamCard(bool left, {BorderRadius borderRadius}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(5.0)
      ),
      decoration: BoxDecoration(
          color: widget.game.place == "Domicile" ?
          left ? _colorTeam : _colorOpponentTeam :
          left ? _colorOpponentTeam : _colorTeam,
          borderRadius: borderRadius
      ),
      child: buildWidgetText(
          text: widget.game.place == "Domicile" ?
          left ? _teamName : widget.game.opponent :
          left ? widget.game.opponent : _teamName,
          family: FontFamily.ARIAL,
          fontSize: getResponsiveSize(20.0)
      ),
    );
  }
}
