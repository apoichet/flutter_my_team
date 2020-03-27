import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/user_service.dart';

import 'home/home.dart';
import 'intro/ready/ready.dart';
import 'loader.dart';

class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {

  Future<StarterResponse> _future;

  @override
  void initState() {
    _future = Future.wait([fetchData(), getUser()])
        .then((futuresResponse) => StarterResponse(
        team: futuresResponse[0],
        user: futuresResponse[1]
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<StarterResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return _evaluateResponse(snapshot.data);
          }
          return Loader();
        });
  }

  _evaluateResponse(StarterResponse starterResponse) {
    Team team = starterResponse.team;
    setTeam(team);
    String user = starterResponse.user;
    if (user != null) {
      setPlayerFromId(user);
      return Home();
    }
    return Ready();
  }
}

class StarterResponse {
  final Team team;
  final String user;
  StarterResponse({@required this.team, @required this.user});
}
