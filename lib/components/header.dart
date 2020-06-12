import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/colors.dart';
import 'package:fc_parisii/theme/font_family.dart';

class Header extends StatelessWidget {

  final String textHeader;
  final Color backgroundColor;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;

  Header({
    @required this.textHeader,
    this.backgroundColor = CustomColors.BlackBackgroundChart,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            bottom: bottomPadding,
            left: leftPadding,
            right: rightPadding,
            top: topPadding,
          ),
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: SvgPicture.asset(
                'assets/icon/backward_arrow_icon.svg',
                height: getResponsiveHeight(16.0),
                fit: BoxFit.fill,
                semanticsLabel: 'Nav Bar Icon'),
          ),
        ),
        Center(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getResponsiveWidth(15.0), 
                  vertical: getResponsiveHeight(5.0)
              ),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: buildWidgetText(
                  fontSize: getResponsiveHeight(15.0),
                  text: textHeader,
                  family: FontFamily.MONTSERRAT_ALTERNATES,
                  weight: FontWeight.w600
              )
          ),
        ),
      ],
    );
  }
}
