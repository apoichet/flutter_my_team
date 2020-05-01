import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/route_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

import 'collective_statistics.dart';

class CollectiveStatisticsMenu extends StatelessWidget {

  final List<String> statMenus;

  CollectiveStatisticsMenu({
    this.statMenus
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
        colors: [
          Color.fromRGBO(165, 201, 219, 0.44),
          Color.fromRGBO(165, 201, 219, 0.10)
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(20.0),
            vertical: getResponsiveHeight(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: statMenus.map((menu) =>
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, buildNoAnimationRoute(CollectiveStatistics(
                        indexTopic: statMenus.indexOf(menu),
                        topics: statMenus,
                      )));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getResponsiveHeight(5.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Colors.white
                            ),
                            color: Color.fromRGBO(242, 242, 242, 0.49),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Center(
                                child: buildWidgetText(
                                    text: menu,
                                    family: FontFamily.ARIAL,
                                    weight: FontWeight.bold,
                                    fontSize: getResponsiveHeight(25.0)
                                ),
                              )
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: SvgPicture.asset(
                                    "assets/icon/detail_icon.svg"
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ).toList(),
          ),
        ));
  }
}
