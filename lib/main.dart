import 'package:flutter/material.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/theme/theme.dart';
import 'package:my_team/views/loader.dart';

import 'views/intro/intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Team',
      theme: buildTheme(),
      home: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<Team> snapshot) {
            if (snapshot.hasData) {
              setTeam(snapshot.data);
              return Intro();
            }
            return Loader();
          }
      ),
    );
  }
}
