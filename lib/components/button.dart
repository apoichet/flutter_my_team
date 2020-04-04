import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/text_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

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
          width: getResponsiveWidth(315.0),
          height: getResponsiveHeight(60.0),
          alignment: Alignment.center,
          child: buildWidgetText(
              fontSize: getResponsiveSize(30.0),
              text: text,
              family: FontFamily.MONTSERRAT,
              weight: FontWeight.w600)
      ),
    );
  }
}

