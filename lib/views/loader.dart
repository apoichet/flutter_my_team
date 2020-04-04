import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';
import 'package:my_team/components/chart/linear_percent_indicator.dart';
import 'package:my_team/components/view_padding.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class Loader extends StatefulWidget {
  final String waitingText = "Un petit instant...";
  final FontFamily waitingTextFamily = FontFamily.MONTSERRAT;

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

  var _delay;

  @override
  void initState() {
    _delay = Future.delayed(Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: 'background_1.png',
        child: ViewPadding(
          child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.asset("assets/img/logo.png")
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: buildWidgetText(
                            fontSize: getResponsiveSize(18.0),
                            text: widget.waitingText,
                            family: widget.waitingTextFamily),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FutureBuilder(
                          future: _delay,
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return _getLinearLoading();
                            }
                            // Empty Widget
                            return SizedBox.shrink();
                          }
                      ),
                    ),
                  ],
                )
              ]
          ),
        ));
  }

  _getLinearLoading() {
    return LinearPercentIndicator(
      alignment: MainAxisAlignment.center,
      animationDuration: 1000,
      lineHeight: getResponsiveHeight(38.0),
      width: getResponsiveWidth(332.0),
      backgroundColor: CustomColors.BackgroundLoader,
      progressColor: CustomColors.Loader,
      animation: true,
      percent: 1,
    );
  }

}
