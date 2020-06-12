import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/url_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

class ResultRanking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchURL(rankingUrl);
      },
      child: Align(
        alignment: Alignment.center,
        child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                padding: EdgeInsets.all(getResponsiveSize(5.0)),
                height: getResponsiveHeight(183.0),
                width: getResponsiveWidth(330.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white,
                        width: 2.0
                    )
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: SvgPicture.asset(
                            'assets/icon/ranking_icon.svg',
                            fit: BoxFit.fill,
                            width: getResponsiveWidth(56.0),
                            height: getResponsiveHeight(56.0),
                            semanticsLabel: 'Ranking'),
                      ),
                    ),
                    Expanded(
                        flex: 6,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: buildWidgetText(
                                  text: "Découvre le classement du championnat sur le site de la FFF",
                                  family: FontFamily.ARIAL,
                                  color: Colors.white,
                                  fontSize: getResponsiveSize(20.0)
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: SvgPicture.asset(
                                    'assets/icon/detail_icon.svg',
                                    fit: BoxFit.fill,
                                    width: getResponsiveWidth(30.0),
                                    height: getResponsiveHeight(30.0),
                                    semanticsLabel: 'Ranking link'),
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
