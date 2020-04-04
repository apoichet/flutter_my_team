import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';

class ViewPadding extends StatelessWidget {

  final Widget child;

  ViewPadding({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(15.0),
          vertical: getResponsiveHeight(30.0)),
      child: child,
    );
  }
}
