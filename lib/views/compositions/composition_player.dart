import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/const/composition_player_card_size.dart';
import 'package:my_team/domain/game_composition_player.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class CompositionPlayer extends StatelessWidget {

  final GameCompositionPlayer gameCompositionPlayer;

  CompositionPlayer({
    @required this.gameCompositionPlayer
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getResponsiveWidth(CompositionPlayerCardSize.widthPlayer),
      height: getResponsiveHeight(CompositionPlayerCardSize.heightPlayer),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/img/player/" + _getAvatar() + ".png",
            width: getResponsiveWidth(CompositionPlayerCardSize.widthAvatar),
            height: getResponsiveHeight(CompositionPlayerCardSize.heightAvatar),
          ),
          buildWidgetText(
              text: gameCompositionPlayer.id.split(" ")[0],
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
    );
  }

  String _getAvatar() {
    String avatar = gameCompositionPlayer.id.replaceAll(" ", "");
    Player player = getTeam().players
        .singleWhere((p) => p.avatar == avatar, orElse: () => null);
    if (player == null) {
      return "avatar";
    }
    return player.avatar;
  }

  Widget _buildPlayerArtifacts() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: gameCompositionPlayer.nbGoal > 2 ? _buildArtifactsWithTooManyGoals()
            : _buildArtifacts()
    );
  }

  _buildArtifactsWithTooManyGoals() {
    return [
      _buildGoal(),
      Padding(
        padding: const EdgeInsets.only(right: 1.0),
        child: buildWidgetText(
            text: " x" + gameCompositionPlayer.nbGoal.toString(),
            family: FontFamily.ARIAL,
            weight: FontWeight.bold,
            fontSize: getResponsiveSize(12.0)
        ),
      ),
      _buildYellowCards()
    ];
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
