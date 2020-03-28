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
                  colors: [
                    Color.fromRGBO(44, 42, 42, 1.0),
                    Color.fromRGBO(52, 50, 50, 0.89),
                    Color.fromRGBO(63, 61, 61, 0.73),
                    Color.fromRGBO(77, 75, 75, 0.52),
                    Color.fromRGBO(90, 88, 88, 0.33),
                    Color.fromRGBO(102, 100, 100, 0.15),
                    Color.fromRGBO(113, 111, 11, 0.0)
                  ],
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
                  colors: [
                    Color.fromRGBO(44, 42, 42, 0.85),
                    Color.fromRGBO(50, 48, 48, 0.75),
                    Color.fromRGBO(80, 78, 78, 0.7),
                    Color.fromRGBO(98, 96, 96, 0.6),
                    Color.fromRGBO(115, 114, 114, 0.5),
                    Color.fromRGBO(141, 140, 140, 0.4),
                    Color.fromRGBO(151, 150, 150, 0.3),
                    Color.fromRGBO(176, 176, 176, 0.2),
                    Color.fromRGBO(222, 222, 22, 0.1),
                    Color.fromRGBO(255, 255, 255, 0.0),
                  ],
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
