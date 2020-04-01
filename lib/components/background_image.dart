import 'package:flutter/widgets.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  final String image;

  BackgroundImage({@required this.child, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(
                  "assets/img/background/" + image
              ),
              fit: BoxFit.fill)
      ),
      child: child,
    );
  }

}
