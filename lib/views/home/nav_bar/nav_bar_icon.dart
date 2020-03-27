import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class NavBarIcon extends StatelessWidget {
  final String pathIcon;
  final String title;

  const NavBarIcon( {Key key,
    @required this.pathIcon,
    @required this.title}) :
        assert(
        title != null,
        pathIcon != null
        ),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(2),
              width: 35,
              height: 35,
              child: SvgPicture.asset(
                  'assets/icon/' + pathIcon + '.svg',
                  fit: BoxFit.fill,
                  semanticsLabel: 'Nav Bar Icon')
          ),
          buildWidgetText(
              text: title,
              family: FontFamily.ARIAL,
              size: 12
          )
        ],
      ),
    );
  }

}
