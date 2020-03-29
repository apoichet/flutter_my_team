import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/views/home/body/statistics/statistics.dart';
import 'package:my_team/views/home/nav_bar/nav_bar.dart';

import 'body/individual_home/individual_home.dart';

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: "background_7.png",
      child: Scaffold(
          body: Statistics(),
          bottomNavigationBar: AppNavBar()
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}
