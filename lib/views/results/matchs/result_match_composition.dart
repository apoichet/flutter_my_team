import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/responsive_size.dart';

class ResultMatchComposition extends StatelessWidget {

  final Game game;

  ResultMatchComposition(this.game);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(5.0),
          vertical: getResponsiveHeight(15.0)
      ),
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white.withOpacity(0.0),
            image: new DecorationImage(
              image: new ExactAssetImage("assets/img/composition.png"),
              fit: BoxFit.contain,
            ),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 10.0),
              child: Container()
            ),
          ),
        ),
      ),
    );
  }
}
