import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/domain/game_type.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/results/matchs/result_match_details_card.dart';

class ResultMatchDetails extends StatelessWidget {

  final Game game;

  ResultMatchDetails(this.game);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: buildWidgetText(
                text: _buildHeader(),
                family: FontFamily.ARIAL,
                color: Colors.white,
                fontSize: getResponsiveWidth(22.0)
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: ResultMatchDetailsCard(game)
        )
      ],
    );
  }

  String _buildHeader() {

    int indexOfGame =  getTeam().games
        .where((g) => g.type == game.type)
        .toList()
        .reversed
        .toList()
        .indexOf(game) + 1;

    switch (game.type) {
      case GameType.FRIENDLY : {
        if(indexOfGame == 1) {
          return "1er match amical";
        }
        return indexOfGame.toString() + "ème match amical";
      }
      case GameType.CHAMPIONSHIP : {
        if(indexOfGame == 1) {
          return "1ère journée de championnat";
        }
        return indexOfGame.toString() + "ème journée de championnat";
      }
      case GameType.CUP : {
        if(indexOfGame == 1) {
          return "1er tour de coupe";
        }
        return indexOfGame.toString() + "ème tour de coupe";
      }
    }

    return "";
  }



}
