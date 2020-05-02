import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/text_service.dart';

var team;
var player;

Future<Team> fetchData() async {
  final Connectivity connectivity = Connectivity();
  connectivity.checkConnectivity();
  final ConnectivityResult connectivityResult = await connectivity.checkConnectivity();

  String data;

  if(ConnectivityResult.none == connectivityResult) {
    data = await  _loadBundleData();
  }
  else {
    //Call Api
    data = await  _loadBundleData();
  }
  return _loadDataFrom(data);
}

Future<String> _loadBundleData() async {
  String data;
  try {
    data = await rootBundle.loadString('assets/data/data.json');
  }
  catch (_) {
    return null;
  }
  return Future.value(data);
}

Future<Team> _loadDataFrom(String data) async {
  try {
    return Team.fromJson(json.decode(data));
  }
  catch (_) {
    return Future.error("Error occured");
  }
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

