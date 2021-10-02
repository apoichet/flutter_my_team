import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/domain/team.dart';
import 'package:fc_parisii/services/io_service.dart';

import 'logger_service.dart';

var team;
var player;

final String dataFileName = 'data.json';
final String appScriptAuthority = 'script.google.com';
final String appScriptPath = '/macros/s/AKfycbw6z6Uha9bOOJs9Qa6NGThnbB95mFkLaa2rLPHV7f7U5CHcDQvj/exec';

Future<DataResponse> fetchDataResponse() async {
  final Connectivity connectivity = Connectivity();
  connectivity.checkConnectivity();
  final ConnectivityResult connectivityResult =
      await connectivity.checkConnectivity();

  try {
    if (ConnectivityResult.none == connectivityResult) {
      return await _getLocalData();
    } else {
      try {
        return await _getApiData();
      } catch (errorApi) {
        logger().i(errorApi.toString());
        return await _getLocalData();
      }
    }
  } catch (error) {
    return Future.error(error);
  }
}

Future<DataResponse> _getApiData() async {
  final responseGet = await http
      .get(Uri.https(appScriptAuthority, appScriptPath))
      .timeout(Duration(milliseconds: 8000))
      .catchError((error) => throw Exception(error));
  Team team = await _parseTeamFrom(responseGet.body);
  await writeData(dataFileName, responseGet.body);
  return DataResponse(team: team, fromApi: true);
}

Future<DataResponse> _getLocalData() async {
  String data = await readData(dataFileName);
  Team team = await _parseTeamFrom(data);
  return DataResponse(team: team, fromApi: false);
}

class DataResponse {
  Team _team;
  bool _fromApi;

  DataResponse({Team team, bool fromApi})
      : _team = team,
        _fromApi = fromApi;

  Team get team => _team;

  bool get isFromApi => _fromApi;
}

Future<Team> _parseTeamFrom(String data) async {
  return Team.fromJson(json.decode(data));
}

void setTeam(Team teamSet) {
  team = teamSet;
}

Team getTeam() {
  return team;
}

void setPlayerFromId(String playerId) {
  player = getTeam()
      .players
      .singleWhere((p) => p.getId() == playerId, orElse: () => null);
}

void setPlayer(Player playerSet) {
  player = playerSet;
}

Player getPlayer() {
  return player;
}
