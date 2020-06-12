import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

import 'arrow.dart';

class FooterCard extends StatelessWidget{

  final bool nextCondition;
  final bool previousCondition;
  final GestureTapCallback nextFunction;
  final GestureTapCallback previousFunction;
  final GestureTapCallback mainCallBack;
  final String text;
  final double textSize;

  FooterCard({
    this.nextCondition,
    this.previousCondition,
    this.nextFunction,
    this.previousFunction,
    this.mainCallBack,
    this.text,
    this.textSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getResponsiveHeight(50),
        padding: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(5.0)),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: Colors.white
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Arrow(
                  onTap: previousFunction??()=>{},
                  svg: "backward_icon.svg",
                  colorCondition: previousCondition
              ),
            ),
            Expanded(
              flex: 8,
              child: GestureDetector(
                onTap: mainCallBack??()=>{},
                child: Center(
                  child: buildWidgetText(
                      text: text,
                      family: FontFamily.ARIAL,
                      weight: FontWeight.bold,
                      fontSize: getResponsiveHeight(textSize)
                  ),
                ),
              ),
            ),
            Expanded(
                child: Arrow(
                    onTap: nextFunction??()=>{},
                    svg: "forward_icon.svg",
                    colorCondition: nextCondition
                )
            ),
          ],
        ));
  }
}
