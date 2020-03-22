import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';

import 'boarding_image.dart';

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
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(0),
            height: size.height * 0.65,
            child: Image.asset('assets/img/boarding/' + imagePath + '.png')
        ),
        Container(
          decoration: BoxDecoration(
              color: CustomColors.BlackBackgroundChart,
              borderRadius: BorderRadius.circular(30)
          ),
          margin: EdgeInsets.symmetric(horizontal: 7),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.subtitle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],

    );
  }

}
