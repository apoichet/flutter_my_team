import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';

class HomeHeaderCard extends StatelessWidget {

  final Widget child;

  HomeHeaderCard(this.child);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.25),
                borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.all(getResponsiveSize(3.0)),
            margin: EdgeInsets.all(getResponsiveSize(3.0)),
            child: child
        ),
      ),
    );
  }
}
