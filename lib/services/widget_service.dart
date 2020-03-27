import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/font_family.dart';

Text buildWidgetText({
  @required String text,
  double size = 12.0,
  FontFamily family = FontFamily.MONTSERRAT,
  FontWeight weight =  FontWeight.normal,
  TextAlign align = TextAlign.center
}) {
  return Text(
      text,
      textAlign: align,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white,
          fontSize: size,
          fontFamily: getFontFamily(family),
          fontWeight: weight
      )
  );
}
