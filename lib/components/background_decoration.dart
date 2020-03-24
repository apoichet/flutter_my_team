import 'package:flutter/widgets.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final String img;

  BackgroundDecoration({@required this.child, @required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(
                  "assets/img/background/" + img
              ),
              fit: BoxFit.fill)
      ),
      child: child,
    );
  }
}
