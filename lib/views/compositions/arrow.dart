import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/responsive_size.dart';

class Arrow extends StatelessWidget {

  final GestureTapCallback onTap;
  final String svg;
  final bool colorCondition;

  Arrow({
    @required this.onTap,
    @required this.svg,
    @required this.colorCondition
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        "assets/icon/" + svg,
        width: getResponsiveSize(18.0),
        color: colorCondition ? Colors.white : Colors.transparent,
        alignment: Alignment.center,
      ),
    );
  }
}
