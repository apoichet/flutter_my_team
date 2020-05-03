import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/views/home/home_header_card.dart';

import '../../components/view_scaffold.dart';
import 'team_health/team_health.dart';
import 'home_card.dart';
import 'next_game.dart';

class Home extends StatelessWidget {
  final String _imgBackgroundName = 'background_7.png';

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: _imgBackgroundName,
        child: ViewScaffold(
          loader: false,
          navBarSelected: NavBarEnum.HOME,
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: BackgroundGradient(
                      colors: [
                        Color.fromRGBO(44, 42, 42, 1.0),
                        Color.fromRGBO(113, 111, 11, 0.22)
                      ],
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: HomeHeaderCard(NextGame())
                            ),
                            Expanded(
                                child: HomeHeaderCard(TeamHealth())
                            )
                          ],
                        ),
                      ),
                    )
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: getResponsiveHeight(8.0)
                    ),
                    child: BackgroundGradient(
                        colors: [
                          Color.fromRGBO(76, 47, 35, 0.56),
                          Color.fromRGBO(255, 255, 255, 0.0),
                        ],
                        child: IndividualCard(
                          team: getTeam(),
                          player: getPlayer(),
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}

