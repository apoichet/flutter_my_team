import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
    return isNullOrEmpty(text) ? SizedBox.shrink() : _buildButton();
  }

  _buildButton() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: RaisedButton(
          splashColor: CustomColors.ButtonSplashColor,
          disabledColor: Colors.transparent,
          onPressed: onPressed,
          colorBrightness: Brightness.light,
          color: CustomColors.ButtonBackgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                  color: CustomColors.ButtonBorderColor,
                  width: 2
              )
          ),
          child: Container(
              width: getResponsiveWidth(315.0) * getResponsiveWidth(0.7),
              height: getResponsiveHeight(60.0 * 0.9),
              alignment: Alignment.center,
              child: buildWidgetText(
                  fontSize: getResponsiveHeight(25.0),
                  text: text,
                  family: FontFamily.MONTSERRAT,
                  weight: FontWeight.w600)
          ),
        ),
      ),
    );
  }
}

