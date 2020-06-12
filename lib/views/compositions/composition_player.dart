import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/const/composition_player_card_size.dart';
import 'package:fc_parisii/domain/game_composition_player.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/statistics/individual/individual_statistics.dart';

class CompositionPlayer extends StatelessWidget {

  final GameCompositionPlayer gameCompositionPlayer;

  CompositionPlayer({
    @required this.gameCompositionPlayer
  });

  @override
  Widget build(BuildContext context) {
    Player _player = _findPlayer();
    return GestureDetector(
      onTap: ()  {
        Navigator.of(context).push(buildNoAnimationRoute(IndividualStatistics(_player)));
      },
      child: Container(
        width: getResponsiveWidth(CompositionPlayerCardSize.widthPlayer),
        height: getResponsiveHeight(CompositionPlayerCardSize.heightPlayer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/img/player/" + _player.avatar + ".png",
              width: getResponsiveWidth(CompositionPlayerCardSize.widthAvatar),
              height: getResponsiveHeight(CompositionPlayerCardSize.heightAvatar),
            ),
            buildWidgetText(
                text: _player.firstName,
                family: FontFamily.ARIAL,
                weight: FontWeight.bold,
                fontSize: getResponsiveWidth(10.0)
            ),
            Container(
                height: getResponsiveHeight(CompositionPlayerCardSize.heightArtifacts),
                padding: EdgeInsets.only(top: 1.0),
                child: _buildPlayerArtifacts()
            )
          ],
        ),
      ),
    );
  }

  Player _findPlayer() {
    return getTeam().players
        .singleWhere((p) => p.getId() == gameCompositionPlayer.id, orElse: () => null);
  }

  Widget _buildPlayerArtifacts() {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: gameCompositionPlayer.nbGoal > 2 ? _buildArtifactsWithTooManyGoals()
              : _buildArtifacts()
      ),
    );
  }

  _buildArtifactsWithTooManyGoals() {
    return [
      _buildGoal(),
      _buildTooManyGoals(),
      _buildYellowCards()
    ];
  }

  Padding _buildTooManyGoals() {
    return Padding(
      padding: const EdgeInsets.only(right: 1.0),
      child: buildWidgetText(
          text: " x" + gameCompositionPlayer.nbGoal.toString(),
          family: FontFamily.ARIAL,
          weight: FontWeight.bold,
          fontSize: getResponsiveWidth(11.0)
      ),
    );
  }

  List<Widget> _buildArtifacts() {
    return [
      _buildGoals(),
      _buildYellowCards()
    ];
  }

  Widget _buildGoals() {
    return gameCompositionPlayer.nbGoal > 0 ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(gameCompositionPlayer.nbGoal, (int i) =>
            _buildGoal()).toList(),
      ),
    ) : SizedBox.shrink();
  }

  Widget _buildYellowCards() {
    return gameCompositionPlayer.nbYellowCard > 0 ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(gameCompositionPlayer.nbYellowCard, (int i) =>
            _buildYellowCard()).toList(),
      ),
    ) : SizedBox.shrink();
  }

  Widget _buildGoal() {
    return Image.asset(
      "assets/img/ball.png",
      width: getResponsiveWidth(CompositionPlayerCardSize.sizeGoal),
      height: getResponsiveHeight(CompositionPlayerCardSize.sizeGoal),
    );
  }

  Widget _buildYellowCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Image.asset(
        "assets/img/yellow_card.png",
        width: getResponsiveWidth(CompositionPlayerCardSize.widthYellowCard),
        height: getResponsiveHeight(CompositionPlayerCardSize.heightYellowCard),
      ),
    );
  }
}
