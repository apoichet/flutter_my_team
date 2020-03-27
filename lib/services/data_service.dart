import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';

var team;
var player;

Future<Team> fetchData() async {
  String data = await rootBundle.loadString('assets/data/data.json');
  await Future.delayed(new Duration(milliseconds: 2000));
  return Team.fromJson(json.decode(data));
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

