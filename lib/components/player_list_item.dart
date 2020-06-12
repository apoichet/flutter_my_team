import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/player_avatar.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

class PlayerListItem extends StatelessWidget {
  final Player player;
  final Color color;
  final pathImage = 'assets/img/';
  final definitionImage = 'png';

  PlayerListItem({this.player, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(3.0)
      ),
      padding: EdgeInsets.all(getResponsiveSize(3.0)),
      decoration: new BoxDecoration(
          color: color,
          border: Border.all(
              width: 2,
              color: Colors.white
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            _CustomBoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.6),
              offset: Offset(0.0, 1.0),
              blurRadius: 1.0,
              blurStyle: BlurStyle.outer
            )
          ]
      ),
      child: Row(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              height: getResponsiveHeight(40.0),
              child: PlayerAvatar(
                  player: player,
                  blurRadius: 6.0,
                  yBlur: 3.0,
                  shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
              )
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: getResponsiveWidth(10.0)),
            child: Row(
                children: <Widget>[
                  buildWidgetText(
                      text: player.firstName + " ",
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(20.0)
                  ),
                  buildWidgetText(
                      text: player.lastName,
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(21.0),
                      weight: FontWeight.bold
                  ),
                  buildWidgetText(
                      text: " - n°",
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(20.0)
                  ),
                  buildWidgetText(
                      text: player.number.toString(),
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveWidth(21.0),
                      weight: FontWeight.bold
                  )
                ]
            ),
          )
        ],
      ),

    );
  }
}

class _CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const _CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(this.blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows)
        result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
