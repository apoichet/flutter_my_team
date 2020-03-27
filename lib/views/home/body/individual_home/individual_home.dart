import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/views/home/body/individual_home/next_game.dart';
import 'package:my_team/views/home/body/individual_home/team_health/team_health.dart';

import 'individual_card.dart';

class _IndividualHomeState extends State<IndividualHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: BackgroundGradient(
                  width: size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          child: NextGame()
                      ),
                      Expanded(
                          flex: 2,
                          child: TeamHealth()
                      )
                    ],
                  ),
                ),
              )
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: BackgroundGradient(
                  width: size.width * 0.9,
                  child: IndividualCard()
              ),
            ),
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
