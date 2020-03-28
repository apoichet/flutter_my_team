import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';

class BackgroundGradient extends StatelessWidget {

  final Widget child;
  final double width;
  final double height;
  final List<Color> colors;

  BackgroundGradient({
    @required this.child,
    @required this.width,
    @required this.height,
    @required this.colors,
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
          colors: colors, // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: child
    );
  }
}
