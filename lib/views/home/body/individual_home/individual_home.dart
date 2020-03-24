import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            child: IndividualCard(),
          )
        ],
      ),
    );
  }
}

class IndividualHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndividualHomeState();
}
