import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class Boarding extends StatelessWidget {

  const Boarding({
    Key key,
    @required this.imagePath,
    @required this.backgroundPath,
    @required this.title,
    this.description,

  }) : assert (

  backgroundPath != null,
  title != null,

  ), super(key: key);

  final String imagePath;
  final String backgroundPath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.only(
                top: getResponsiveHeight(35.0)
            ),
            child: Image.asset(
              'assets/img/boarding/' + imagePath + '.png',
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(getResponsiveSize(10.0)),
            padding: EdgeInsets.all(getResponsiveSize(12.0)),
            decoration: BoxDecoration(
                color: CustomColors.BlackBackgroundChart,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: buildWidgetText(
                      fontSize: getResponsiveSize(25.0),
                      text: title,
                      family: FontFamily.MONTSERRAT_ALTERNATES,
                      weight: FontWeight.w700),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(getResponsiveSize(4.0)),
                    child: buildWidgetText(
                        fontSize: getResponsiveSize(16.0),
                        text: description,
                        family: FontFamily.MONTSERRAT_ALTERNATES,
                        weight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],

    );
  }

}
