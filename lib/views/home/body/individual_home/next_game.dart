import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';


class _NextGameState extends State<NextGame> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text('Prochain Match', textAlign: TextAlign.end, style: Theme.of(context).textTheme.title),
          Text('Nanterre le 02/03 à Balard', textAlign: TextAlign.end, style: Theme.of(context).textTheme.subtitle),
        ]
    );
  }

}

class NextGame extends StatefulWidget {
  final Game lastGame;

  NextGame({this.lastGame});

  @override
  State<StatefulWidget> createState() => _NextGameState();
}
