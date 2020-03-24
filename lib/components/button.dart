import 'package:flutter/material.dart';
import 'package:my_team/theme/colors.dart';

getHeightButton(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.09;
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
    return _isNullOrEmpty(text) ? Text("") : RaisedButton(
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
          child: Text(
              text,
              style: Theme.of(context).textTheme.caption)
      ),
    );
  }

  _isNullOrEmpty(String text) {
    return text == null || text == "";
  }
}

