import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/views/home/nav_bar/nav_bar.dart';

import 'body/individual_home/individual_home.dart';

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/img/background/background_7.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
            body: IndividualHome(
              team: widget.team,
              player: widget.player,
            ),
            bottomNavigationBar: AppNavBar()
        )
    );
  }

}

class Home extends StatefulWidget {
  final Team team;
  final Player player;

  Home({
        @required this.team,
        @required this.player
      });

  @override
  State<StatefulWidget> createState() => _HomeState();
}
