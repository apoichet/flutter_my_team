import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_team/services/text_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

getHeightButton(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.08;
}

getWidthButton(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.6;
}

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  Button({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return isNullOrEmpty(text) ? SizedBox.shrink() : RaisedButton(
      splashColor: CustomColors.BlackBackgroundChart,
      disabledColor: Colors.transparent,
      onPressed: onPressed,
      color: CustomColors.RaisedButtonBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
              color: CustomColors.RaisedButtonBorder,
              width: 2
          )
      ),
      child: Container(
          width: getWidthButton(context),
          height: getHeightButton(context),
          alignment: Alignment.center,
          child: buildWidgetText(
              text: text,
              family: FontFamily.MONTSERRAT,
              weight: FontWeight.w600,
              size: 25)
      ),
    );
  }
}

