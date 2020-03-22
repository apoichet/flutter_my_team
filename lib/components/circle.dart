import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Circle extends StatelessWidget {

  final bool full;

  const Circle({Key key, this.full = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: full ? Colors.green : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: full ? Colors.green : Colors.white)
        ),
    );
  }

}
