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
final String appScriptUrl = 'https://script.googleusercontent.com/macros/echo?user_content_key=4Kf9UyTbX6kWvNk9ympZSnGBDi0eLxxRIGaJZMoooWGOowoArPlHcW8mXBNLUarotC5Yjq5mCuZDlUrtJqmuYY7_cmmy96Nkm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnM-ZhxYhH8JVX6ZA016_PjVZfB3Lqr-FAdNSgGLaeY7ypZIFofQDOXa8mzDTCqnGIg&lib=MyqGG5TeYaZyOzm4JsxBVf8nujT8rVGfZ';

Future<DataResponse> fetchDataResponse() async {
  final Connectivity connectivity = Connectivity();
  connectivity.checkConnectivity();
  final ConnectivityResult connectivityResult = await connectivity.checkConnectivity();

  try {
    if(ConnectivityResult.none == connectivityResult) {
      return await _getLocalData();
    }
    else {
      try {
        return await _getApiData();
      }
      catch (errorApi) {
        logger().i(errorApi.toString());
        return await _getLocalData();
      }
    }
  }
  catch (error) {
    return Future.error(error);
  }
}

Future<DataResponse> _getApiData() async {
  http.Response responseGet = await http.get(appScriptUrl)
      .timeout(Duration(milliseconds: 8000))
      .catchError((error) => throw Exception(error));
  Team team =  await _parseTeamFrom(responseGet.body);
  await writeData(dataFileName, responseGet.body);
  return DataResponse(team: team, fromApi: true);
}

Future<DataResponse> _getLocalData() async {
  String data = await readData(dataFileName);
  Team team =  await _parseTeamFrom(data);
  return DataResponse(team: team, fromApi: false);
}

class DataResponse {
  Team _team;
  bool _fromApi;

  DataResponse({Team team, bool fromApi}) : _team = team, _fromApi = fromApi;

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
  player = getTeam().players.singleWhere((p) => p.getId() == playerId, orElse: () => null);
}

void setPlayer(Player playerSet) {
  player = playerSet;
}

Player getPlayer() {
  return player;
}

