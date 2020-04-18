import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/font_family.dart';

AutoSizeText buildWidgetText({
  @required String text,
  FontFamily family = FontFamily.MONTSERRAT,
  FontWeight weight =  FontWeight.normal,
  TextAlign align = TextAlign.center,
  Color color = Colors.white,
  maxFontSize = 40.0,
  minFontSize = 7.0,
  fontSize = 12.0,
}) {
  return AutoSizeText(
      text,
      textAlign: align,
      maxFontSize: maxFontSize,
      minFontSize: minFontSize,
      overflow: TextOverflow.fade,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: color,
          fontFamily: getFontFamily(family),
          fontWeight: weight,
          fontSize: fontSize
      )
  );
}
