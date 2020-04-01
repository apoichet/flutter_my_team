import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';
import 'package:my_team/components/view_padding.dart';

import '../intro.dart';

class Ready extends StatelessWidget {

  final String buttonReadyText = "C'est parti !";

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: 'background_1.png',
        child: ViewPadding(
          child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.asset("assets/img/logo.png")
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    text: buttonReadyText,
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
