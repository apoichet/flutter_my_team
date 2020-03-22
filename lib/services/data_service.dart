import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:my_team/domain/team.dart';

var team;

Future<Team> fetchData() async {
  final response = await Future.delayed(new Duration(seconds: 2), () {
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

