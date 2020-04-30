import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class NavBarIcon extends StatelessWidget {
  final String pathIcon;
  final String title;
  final double width;
  final double height;
  final bool select;
  final onTap;

  const NavBarIcon( {Key key,
    @required this.pathIcon,
    @required this.title,
    @required this.height,
    @required this.width,
    @required this.onTap,
    this.select = true
  }) :assert(title != null, pathIcon != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: select ? _buildNavBarIcon(Colors.white) :
        _buildNavBarIcon(Colors.white.withOpacity(0.5))
    );
  }

  _buildNavBarIcon(Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getResponsiveHeight(5.0),
        horizontal: getResponsiveWidth(5.0)
      ),
      child: Column(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Container(
                    alignment: Alignment.center,
                    width: getResponsiveWidth(width),
                    height: getResponsiveHeight(height),
                    child: SvgPicture.asset(
                        'assets/icon/' + pathIcon + '.svg',
                        color: color,
                        semanticsLabel: 'Nav Bar Icon')
                )
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: buildWidgetText(
                    text: title,
                    family: FontFamily.MONTSERRAT,
                    weight: FontWeight.w400,
                    color: color
                ),
              ),
            )
          ]),
    );
  }

}
