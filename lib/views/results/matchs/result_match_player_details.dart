import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/domain/game_composition_player.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/route_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/statistics/individual/individual_statistics.dart';

class ResultMatchPlayerDetails extends StatefulWidget {

  final GameCompositionPlayer gameCompositionPlayer;

  ResultMatchPlayerDetails(this.gameCompositionPlayer);

  @override
  _ResultMatchPlayerDetailsState createState() => _ResultMatchPlayerDetailsState();
}

class _ResultMatchPlayerDetailsState extends State<ResultMatchPlayerDetails> {

  Player _player;

  @override
  void initState() {
    _player = getTeam().players
        .singleWhere((player) => player.getId() == widget.gameCompositionPlayer.id.replaceAll(" ", ""),
        orElse: () => getTeam().players[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(buildNoAnimationRoute(
          IndividualStatistics(
            player: _player,
          )
      )),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getResponsiveHeight(5.0)
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveWidth(8.0)
                ),
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/img/player/" + _player.avatar + ".png",
                  width: getResponsiveWidth(28.0),
                  height: getResponsiveHeight(28.0),
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: _player.firstName,
                      family: FontFamily.ARIAL,
                      fontSize: getResponsiveSize(20.0)
                  ),
                )
            ),
            Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _getBalls(),
                    _getYellowCard()
                  ],
                )
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                    'assets/icon/detail_icon.svg',
                    fit: BoxFit.fill,
                    width: getResponsiveWidth(23.0),
                    height: getResponsiveHeight(23.0),
                    semanticsLabel: 'Nav Bar Icon'),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getYellowCard() {
    return Row(
      children: Iterable<int>.generate(widget.gameCompositionPlayer.nbYellowCard)
          .map((nbGoal) => Image.asset(
        "assets/img/yellow_card.png",
        width: getResponsiveWidth(20.0),
        height: getResponsiveHeight(20.0),
        filterQuality: FilterQuality.high,
      )).toList(),
    );
  }

  _getBalls() {
    if(widget.gameCompositionPlayer.nbGoal > 2) {
      return  Row(
          children: <Widget>[
            Image.asset(
              "assets/img/ball.png",
              width: getResponsiveWidth(20.0),
              height: getResponsiveHeight(20.0),
              filterQuality: FilterQuality.high,
            ),
            buildWidgetText(
                text: "x" + widget.gameCompositionPlayer.nbGoal.toString(),
                family: FontFamily.ARIAL,
                fontSize: 15.0,
                weight: FontWeight.bold
            )
          ]
      );
    }
    return  Row(
      children: Iterable<int>.generate(widget.gameCompositionPlayer.nbGoal)
          .map((nbGoal) => Image.asset(
        "assets/img/ball.png",
        width: getResponsiveWidth(20.0),
        height: getResponsiveHeight(20.0),
        filterQuality: FilterQuality.high,
      )).toList(),
    );
  }
}
