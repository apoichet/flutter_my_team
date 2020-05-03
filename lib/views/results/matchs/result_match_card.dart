import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/components/view_scaffold.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/views/results/matchs/result_match_composition.dart';
import 'package:my_team/views/results/matchs/result_match_details.dart';

class ResultMatchCard extends StatelessWidget {

  final Game game;

  ResultMatchCard(this.game);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: "background_16.png",
        child: ViewScaffold(
          navBarSelected: NavBarEnum.CALENDAR,
          bottomPadding: 0.0,
          body: Column(
              children: <Widget>[
                Expanded(
                    child: Header(
                        textHeader: "Résultats",
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.5)
                    )
                ),
                Expanded(
                    flex: 9,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: ResultMatchDetails(game),
                        ),
                        Expanded(
                          flex: 4,
                          child: ResultMatchComposition(game),
                        )
                      ],
                    )
                )
              ]
          ),
        )
    );
  }
}
