import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';

class Circle extends StatelessWidget {

  final bool full;

  const Circle({Key key, this.full = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: getResponsiveWidth(14.0),
        height: getResponsiveHeight(14.0),
        decoration: BoxDecoration(
            color: full ? Colors.green : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: full ? Colors.green : Colors.white)
        ),
    );
  }

}
