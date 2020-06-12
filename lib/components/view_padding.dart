import 'package:flutter/widgets.dart';
import 'package:fc_parisii/services/responsive_size.dart';

class ViewPadding extends StatelessWidget {

  final Widget child;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;

  ViewPadding({
    @required this.child,
    this.topPadding = 30.0,
    this.bottomPadding = 30.0,
    this.leftPadding = 15.0,
    this.rightPadding = 15.0
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: getResponsiveHeight(topPadding),
          bottom: getResponsiveHeight(bottomPadding),
          left: getResponsiveWidth(leftPadding),
          right: getResponsiveWidth(rightPadding)
      ),
      child: child,
    );
  }
}
