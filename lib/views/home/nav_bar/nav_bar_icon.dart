import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class NavBarIcon extends StatelessWidget {
  final String pathIcon;
  final String title;
  final double width;
  final double height;

  const NavBarIcon( {Key key,
    @required this.pathIcon,
    @required this.title,
    @required this.height,
    @required this.width,
  }) :
        assert(
        title != null,
        pathIcon != null
        ),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2),
        width: width,
        height: height,
        child: SvgPicture.asset(
            'assets/icon/' + pathIcon + '.svg',
            fit: BoxFit.fill,
            semanticsLabel: 'Nav Bar Icon')
    );
  }

}
