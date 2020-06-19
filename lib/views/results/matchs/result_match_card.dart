import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_image.dart';
import 'package:fc_parisii/components/header.dart';
import 'package:fc_parisii/components/nav_bar/nav_bar.dart';
import 'package:fc_parisii/components/view_scaffold.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/views/results/matchs/result_match_composition.dart';
import 'package:fc_parisii/views/results/matchs/result_match_details.dart';

class ResultMatchCard extends StatelessWidget {

  final Game game;

  ResultMatchCard(this.game);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: "background_14.png",
        child: ViewScaffold(
          navBarSelected: NavBarEnum.CALENDAR,
          bottomPadding: 0.0,
          header: Header(
              textHeader: "Résultats",
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.5)
          ),
          body: Column(
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
          ),
        )
    );
  }
}
