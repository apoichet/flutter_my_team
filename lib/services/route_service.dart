import 'package:flutter/widgets.dart';

Route buildNoAnimationRoute(Widget route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //No Animation between transition route
      return child;
    },
  );
}


