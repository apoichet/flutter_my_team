import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fc_parisii/components/player_avatar.dart';
import 'package:fc_parisii/domain/game_composition_player.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/statistics/individual/individual_statistics.dart';

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
          IndividualStatistics(_player)
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
                height: getResponsiveHeight(30.0),
                padding: EdgeInsets.symmetric(
                    horizontal: getResponsiveWidth(8.0)
                ),
                alignment: Alignment.centerRight,
                child: PlayerAvatar(
                  player:  _player,
                  blurRadius: 3.0,
                  yBlur: 3.0,
                  shadowColor: Color.fromRGBO(0, 0, 0, 0.7),
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
                      fontSize: getResponsiveWidth(18.0)
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
          .map((nbGoal) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(10.0),
            vertical: getResponsiveHeight(2.0)
        ),
        child: Image.asset(
          "assets/img/yellow_card.png",
          height: getResponsiveHeight(18.0),
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
      )).toList(),
    );
  }

  _getBalls() {
    if(widget.gameCompositionPlayer.nbGoal > 2) {
      return  Row(
          children: <Widget>[
            _buildBallImage(),
            buildWidgetText(
                text: "x" + widget.gameCompositionPlayer.nbGoal.toString(),
                family: FontFamily.ARIAL,
                fontSize: getResponsiveWidth(18.0),
                weight: FontWeight.bold
            )
          ]
      );
    }
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: Iterable<int>.generate(widget.gameCompositionPlayer.nbGoal)
          .map((nbGoal) => _buildBallImage()).toList(),
    );
  }
  Widget _buildBallImage() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(2.0)
      ),
      child: Image.asset(
          "assets/img/ball.png",
          width: getResponsiveWidth(18.0),
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill
      ),
    );

  }
}
