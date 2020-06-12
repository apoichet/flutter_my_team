import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/services/responsive_size.dart';

class Circle extends StatelessWidget {

  final bool full;
  final double size;
  final Color colorFull;
  final Color colorEmpty;

  const Circle(
      {Key key,
        this.full = false,
        this.size = 14.0,
        this.colorFull,
        this.colorEmpty
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: getResponsiveWidth(size),
      height: getResponsiveHeight(size),
      decoration: BoxDecoration(
          color: full ? colorFull : colorEmpty,
          shape: BoxShape.circle,
          border: Border.all(color: full ? colorFull : colorEmpty)
      ),
    );
  }

}
