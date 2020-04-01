import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/components/background_image.dart';

import '../../components/view_scaffold.dart';
import 'team_health/team_health.dart';
import 'home_card.dart';
import 'next_game.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundImage(
        image: "background_7.png",
        child: ViewScaffold(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: BackgroundGradient(
                        colors: [
                          Color.fromRGBO(44, 42, 42, 1.0),
                          Color.fromRGBO(113, 111, 11, 0.22)
                        ],
                        width: size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: _buildHeaderContainer(
                                    child: NextGame(),
                                    size: size
                                )
                              ),
                              Expanded(
                                  child: _buildHeaderContainer(
                                      child: TeamHealth(),
                                      size: size
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                Expanded(
                  flex: 5,
                  child: BackgroundGradient(
                      colors: [
                        Color.fromRGBO(76, 47, 35, 0.56),
                        Color.fromRGBO(255, 255, 255, 0.0),
                      ],
                      width: size.width * 0.9,
                      child: IndividualCard()
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

  _buildHeaderContainer({@required Widget child, Size size}) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            borderRadius: BorderRadius.circular(20)
        ),
        width: size.width * 0.85,
        padding: EdgeInsets.all(3.0),
        margin: EdgeInsets.all(3.0),
        child: child
    );
  }

}

