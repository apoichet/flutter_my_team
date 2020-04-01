import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';
import 'package:my_team/components/chart/linear_percent_indicator.dart';
import 'package:my_team/components/view_padding.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

class Loader extends StatefulWidget {
  final String waitingText = "Un petit instant...";
  final FontFamily waitingTextFamily = FontFamily.MONTSERRAT;
  final double waitingTextSize = 15.0;
  
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
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  alignment: Alignment.bottomCenter,
                  child: buildWidgetText(
                      text: widget.waitingText,
                      family: widget.waitingTextFamily,
                      size: widget.waitingTextSize),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
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
              ]
          ),
        ));
  }

  _getLinearLoading() {
    return LinearPercentIndicator(
      alignment: MainAxisAlignment.center,
      animationDuration: 1000,
      lineHeight: getHeightButton(context) * 0.5,
      width: getWidthButton(context) * 1.2,
      backgroundColor: CustomColors.BackgroundLoader,
      progressColor: CustomColors.Loader,
      animation: true,
      percent: 1,
    );
  }

}
