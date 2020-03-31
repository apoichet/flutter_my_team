import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class Header extends StatelessWidget {

  final String textHeader;
  final Color backgroundColor;

  Header({
    @required this.textHeader,
    this.backgroundColor = CustomColors.BlackBackgroundChart});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: SvgPicture.asset(
                'assets/icon/backward_arrow_icon.svg',
                fit: BoxFit.fill,
                semanticsLabel: 'Nav Bar Icon'),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: buildWidgetText(
                  text: textHeader,
                  family: FontFamily.MONTSERRAT_ALTERNATES,
                  size: 25,
                  weight: FontWeight.w600
              )
          ),
        ),
      ],
    );
  }
}
