import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class Header extends StatelessWidget {

  final String textHeader;

  Header({@required this.textHeader});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
                'assets/icon/backward_arrow_icon.svg',
                fit: BoxFit.fill,
                semanticsLabel: 'Nav Bar Icon'),
          ),
        ),
        Center(
          child: Container(
              height: 43,
              width: 182,
              decoration: BoxDecoration(
                  color: CustomColors.BlackBackgroundChart,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Align(
                alignment: Alignment.center,
                child: buildWidgetText(
                    text: textHeader,
                    family: FontFamily.MONTSERRAT_ALTERNATES,
                    size: 25,
                    weight: FontWeight.w600
                ),
              )
          ),
        ),
      ],
    );
  }
}
