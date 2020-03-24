import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_decoration.dart';
import 'package:my_team/components/button.dart';
import 'package:my_team/components/chart/linear_percent_indicator.dart';
import 'package:my_team/theme/colors.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundDecoration(
        img: 'background_1.png',
        child: Container(
          child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.asset("assets/img/logo.png")
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Un petit instant...', style: Theme.of(context).textTheme.subtitle),
                      ),
                      LinearPercentIndicator(
                        alignment: MainAxisAlignment.center,
                        animationDuration: 1000,
                        lineHeight: getHeightButton(context) * 0.5,
                        width: getWidthButton(context) * 1.2,
                        backgroundColor: CustomColors.BackgroundLoader,
                        progressColor: CustomColors.Loader,
                        animation: true,
                        percent: 1,
                      ),
                    ],
                  ),
                )
              ]
          ),
        ));
  }

}
