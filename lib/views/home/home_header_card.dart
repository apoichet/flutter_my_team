import 'package:flutter/widgets.dart';

class HomeHeaderCard extends StatelessWidget {

  final Widget child;

  HomeHeaderCard(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.all(3.0),
        margin: EdgeInsets.all(3.0),
        child: child
    );
  }
}
