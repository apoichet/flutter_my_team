import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';

class BackgroundGradient extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;

  BackgroundGradient({
    @required this.child,
    @required this.width,
    @required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
          colors: [
            Color.fromRGBO(44, 42, 42, 0.9),
            Color.fromRGBO(60, 58, 58, 0.8),
            Color.fromRGBO(90, 88, 88, 0.7),
            Color.fromRGBO(108 , 106, 106, 0.6),
            Color.fromRGBO(125 , 124, 124, 0.5),
            Color.fromRGBO(151 , 150, 150, 0.4),
            Color.fromRGBO(161 , 160, 160, 0.3),
            Color.fromRGBO(186, 186, 186, 0.2),
            Color.fromRGBO(232, 232, 232, 0.1),
            Color.fromRGBO(255, 255, 255, 0.0),
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: child
    );
  }
}
