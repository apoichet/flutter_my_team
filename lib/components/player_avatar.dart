import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/domain/player.dart';

class PlayerAvatar extends StatelessWidget {
  final Player player;
  final double scale;
  final double blurRadius;
  final double xBlur;
  final double yBlur;
  final Color shadowColor;
  final Matrix4 transform;

  PlayerAvatar({
    @required this.player,
    this.scale = 1.0,
    this.transform,
    this.blurRadius = 0.0,
    this.xBlur = 0.0,
    this.yBlur = 0.0,
    this.shadowColor
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        transform: transform,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: shadowColor!= null ? shadowColor : Colors.transparent,
                blurRadius: blurRadius,
                offset: Offset(
                  xBlur, // horizontal, move right 10
                  yBlur, // vertical, move down 10
                ),
              )]
        ),
        child: Image.asset(
          "assets/img/player/" + player.avatar + ".png",
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
