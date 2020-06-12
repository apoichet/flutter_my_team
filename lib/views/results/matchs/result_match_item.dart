import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/domain/game_state.dart';
import 'package:fc_parisii/domain/game_type.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/results/matchs/result_match_card.dart';

class ResultMatchItem extends StatelessWidget {

  final Game game;

  const ResultMatchItem({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, buildNoAnimationRoute(ResultMatchCard(game)));
      },
      child: ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveWidth(15.0),
                    vertical: getResponsiveHeight(7.0)
                ),
                height: getResponsiveHeight(125.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2)
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: buildWidgetText(
                                  text: toGameType(game.type),
                                  family: FontFamily.ARIAL,
                                  weight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: getResponsiveWidth(20.0)
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: buildWidgetText(
                                  text: game.opponent + " " + _getDateMatch(game),
                                  family: FontFamily.ARIAL,
                                  color: Colors.white,
                                  fontSize: getResponsiveWidth(20.0)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: buildWidgetText(
                                      text: _getStateMatch(game),
                                      family: FontFamily.ARIAL,
                                      color: Colors.white,
                                      fontSize: getResponsiveWidth(18.0)
                                  ),
                                )),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(
                                    'assets/icon/detail_icon.svg',
                                    fit: BoxFit.fill,
                                    width: getResponsiveWidth(30.0),
                                    height: getResponsiveHeight(30.0),
                                    semanticsLabel: 'Match details'),
                              ),
                            ),
                          ]),
                    )
                  ],
                )
            )
        ),
      ),
    );
  }

  _getStateMatch(Game game) {
    if(game.date.isAfter(DateTime.now().toLocal())) {
      return "Coup d'envoi " + game.timeMatch + " rdv " + game.timeRdvMatch;
    }
    return toGameState(game.state) +
        " " +
        _getPlaceMatch(game) +
        " " +
        game.score;
  }

  _getDateMatch(Game game) {
    String day = game.date.day.toString().length == 1 ?
    "0" + game.date.day.toString() : game.date.day.toString();
    String month = game.date.month.toString().length == 1 ?
    "0" + game.date.month.toString() : game.date.month.toString();
    return day + "/" + month + "/" + game.date.year.toString();
  }

  _getPlaceMatch(Game game) {
    if(game.place == "Domicile") {
      return "à domicile";
    }
    return "à l'extérieur";
  }

}
