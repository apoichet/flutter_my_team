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
            CustomColors.IndividualCardContainerGradientStart,
            CustomColors.IndividualCardContainerGradientMiddle,
            CustomColors.IndividualCardContainerGradientEnd
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: child
    );
  }
}
