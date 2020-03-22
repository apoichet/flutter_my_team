import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
              width: 55,
              height: 55,
              child: SvgPicture.asset(
                  'assets/icon/' + pathIcon + '.svg',
                  fit: BoxFit.fill,
                  semanticsLabel: 'Nav Bar Icon')
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.body2,
          )

        ],
      ),
    );
  }

}
