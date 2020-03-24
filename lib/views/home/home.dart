import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_decoration.dart';
import 'package:my_team/views/home/nav_bar/nav_bar.dart';

import 'body/individual_home/individual_home.dart';

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      img: "background_7.png",
      child: Scaffold(
          body: IndividualHome(),
          bottomNavigationBar: AppNavBar()
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}
