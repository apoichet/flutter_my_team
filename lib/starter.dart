import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/preventing_widget.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/logger_service.dart';
import 'package:my_team/services/text_service.dart';
import 'package:my_team/services/user_service.dart';
import 'package:my_team/views/home/home.dart';
import 'package:my_team/views/show_error.dart';

import 'services/responsive_size.dart';
import 'views/intro/ready/ready.dart';
import 'views/loader.dart';


class Starter extends StatefulWidget {
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {

  Future<StarterResponse> _future;

  @override
  void initState() {
    _future = Future.wait([fetchDataResponse(), getUser()])
        .then((futuresResponse) => StarterResponse(
        dataResponse: futuresResponse[0],
        userId: futuresResponse[1]
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    setResponsiveSize(width, height);
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<StarterResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return _evaluateResponse(snapshot.data);
          }
          if(snapshot.connectionState == ConnectionState.none || snapshot.hasError) {
            logger().e(snapshot.error);
            return ShowError();
          }
          return Loader();
        });
  }

  Widget _evaluateResponse(StarterResponse starterResponse) {
    DataResponse dataResponse = starterResponse.dataResponse;
    setTeam(dataResponse.team);
    setPlayerFromId(starterResponse.userId);

    if(starterResponse.hasUser && dataResponse.isFromApi) {
      return Home();
    }
    if(starterResponse.hasUser && !dataResponse.isFromApi) {
      return PreventingWidget(
        duration: Duration(milliseconds: 1200),
        next: Home(),
        preventingText: "Mise à jour des données impossible",
      );
    }
    return Ready();
  }
}

class StarterResponse {
  final DataResponse _dataResponse;
  final String _userId;
  StarterResponse({@required dataResponse, @required userId}) : _dataResponse = dataResponse, _userId = userId;

  String get userId => _userId;
  bool get hasUser => isNotNullAndNotEmpty(_userId);
  DataResponse get dataResponse => _dataResponse;
}
