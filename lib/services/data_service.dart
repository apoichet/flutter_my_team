import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';

var team;
var player;

Future<Team> fetchData() async {
  final response = await Future.delayed(new Duration(seconds: 1), () {
    return rootBundle.loadString('assets/data/data.json');
  });
  return Team.fromJson(json.decode(response));
}

void setTeam(Team teamSet) {
  team = teamSet;
}

Team getTeam() {
  return team;
}

void setPlayerFromId(String playerId) {
  player = getTeam().players.singleWhere((p) => p.getId() == playerId);
}

void setPlayer(Player playerSet) {
  player = playerSet;
}

Player getPlayer() {
  return player;
}

