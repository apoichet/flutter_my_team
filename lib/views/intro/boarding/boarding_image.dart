import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoardingImage extends StatelessWidget {
  const BoardingImage(this.name, {Key key}) : assert (name != null), super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/img/boarding/' + this.name + '.png'),
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.cover,
          image: AssetImage('assets/img/boarding/' + this.name + '.png')),
        ),
      );
  }
}
