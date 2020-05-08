import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/logger_service.dart';
import 'package:my_team/services/text_service.dart';
import 'package:my_team/services/user_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/home/home.dart';
import 'package:my_team/views/show_error.dart';

import 'services/responsive_size.dart';
import 'views/intro/ready/ready.dart';
import 'views/loader.dart';


class Starter extends StatefulWidget {

  final String noUpdateDataMsg = 'Mise à jour des données impossible';

  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {

  Future<StarterResponse> _dataFetched;

  @override
  void initState() {
    _dataFetched = Future.wait([fetchDataResponse(), getUser()])
        .then((futuresResponse) {
          var starterResponse = StarterResponse(dataResponse: futuresResponse[0], userId: futuresResponse[1]);
          setTeam(starterResponse.dataResponse.team);
          setPlayerFromId(starterResponse.userId);
          return starterResponse;});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    setResponsiveSize(width, height);
    return StreamBuilder(
        stream: _streamDataResponse().timeout(Duration(milliseconds: 5000)),
        builder: (BuildContext context, AsyncSnapshot<StarterResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return _evaluateResponse(snapshot.data);
          }
          if(snapshot.connectionState == ConnectionState.none || snapshot.hasError) {
            return ShowError();
          }
          return _buildLoader(snapshot.data);
        });
  }

  Stream<StarterResponse> _streamDataResponse() async* {
    StarterResponse starterResponse = await _dataFetched.catchError((onError) {
      logger().e(onError);
    });
    if(starterResponse != null) {
      await Future.delayed(Duration(milliseconds: 200));
      yield starterResponse;
      if(!starterResponse.dataResponse.isFromApi) {
        starterResponse.preventingMessage = widget.noUpdateDataMsg;
        yield starterResponse;
        await Future.delayed(Duration(milliseconds: 1000));
      }
    }
  }

  Widget _buildLoader(StarterResponse starterResponse) {
    return Stack(
      children: <Widget>[
        Loader(),
        Container(
          padding: EdgeInsets.only(
            bottom: getResponsiveHeight(100.0)
          ),
          alignment: Alignment.bottomCenter,
          child: buildWidgetText(
            text: starterResponse != null ? starterResponse.preventingMessage : '',
            family: FontFamily.ARIAL,
            fontSize: getResponsiveSize(20.0),
            color: Colors.white,
          ),
        )
      ],

    );
  }

  Widget _evaluateResponse(StarterResponse starterResponse) {
    if(starterResponse.hasUser) {
      return Home();
    }
    return Ready();
  }
}

class StarterResponse {
  final DataResponse _dataResponse;
  final String _userId;
  String _preventingMessage;
  StarterResponse({@required dataResponse, @required userId, preventingMessage}) : _dataResponse = dataResponse, _userId = userId, _preventingMessage = preventingMessage;

  String get userId => _userId;
  bool get hasUser => isNotNullAndNotEmpty(_userId);
  DataResponse get dataResponse => _dataResponse;
  String get preventingMessage => isNullOrEmpty(_preventingMessage) ? '' : _preventingMessage;
  set preventingMessage(String preventingMessage) => _preventingMessage = preventingMessage;

}
