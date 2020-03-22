import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/views/home/body/individual_home/next_game.dart';
import 'package:my_team/views/home/body/individual_home/team_health/team_health.dart';

import 'individual_card.dart';

class _IndividualHomeState extends State<IndividualHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: NextGame()
          ),
          Expanded(
              flex: 2,
              child: TeamHealth()
          ),
          Expanded(
            flex: 6,
            child: _getIndividualCard(),
          )
        ],
      ),
    );
  }

  _getIndividualCard() {
    return IndividualCard(
      player: widget.player,
      maxGame: widget.team.maxPlayerGame,
      maxGameTime: widget.team.maxPlayerGameTime,
      maxGoal: widget.team.maxPlayerGoal,
      maxMissing: widget.team.maxPlayerMissingGame,
      maxLate: widget.team.maxPlayerLateGame,
      maxPass: widget.team.maxPlayerPass,
      maxYellowCard: widget.team.maxPlayerYellowCard
    );
  }

}

class IndividualHome extends StatefulWidget {
  final Team team;
  final Player player;
  IndividualHome({
    @required this.team,
    @required this.player
  });
  @override
  State<StatefulWidget> createState() => _IndividualHomeState();
}
