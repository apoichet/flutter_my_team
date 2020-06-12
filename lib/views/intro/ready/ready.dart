import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_image.dart';
import 'package:fc_parisii/components/button.dart';
import 'package:fc_parisii/components/view_padding.dart';
import 'package:fc_parisii/services/responsive_size.dart';

import '../intro.dart';

class Ready extends StatelessWidget {

  final String buttonReadyText = "Commencer";

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
                  padding: EdgeInsets.only(bottom: getResponsiveHeight(8.0)),
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    text: buttonReadyText,
                    onPressed: () =>
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Intro()))
                  ),
                )
              ]
          ),
        ));
  }
}
