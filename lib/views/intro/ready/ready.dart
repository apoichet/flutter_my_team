import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';

import '../intro.dart';

class Ready extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: 'background_1.png',
        child: Container(
          child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.asset("assets/img/logo.png")
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    text: 'C\'est parti !',
                    onPressed: () =>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Intro()))
                  ),
                )
              ]
          ),
        ));
  }
}
