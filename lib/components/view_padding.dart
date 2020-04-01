import 'package:flutter/widgets.dart';

class ViewPadding extends StatelessWidget {

  final Widget child;


  ViewPadding({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: child,
    );
  }
}
