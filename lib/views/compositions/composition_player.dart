import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/const/composition_player_card_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class CompositionPlayer extends StatelessWidget {

  final String firstName;
  final int nbGoal;
  final int nbYellowCard;
  final String avatar;

  CompositionPlayer({
    @required this.firstName,
    this.nbGoal = 0,
    this.nbYellowCard = 0,
    this.avatar = "avatar"
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CompositionPlayerCardSize.widthPlayer,
      height: CompositionPlayerCardSize.heightPlayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/img/player/AlexisVaysse11.png",
            width: CompositionPlayerCardSize.widthAvatar,
            height: CompositionPlayerCardSize.heightAvatar,
          ),
          buildWidgetText(
              text: firstName,
              size: CompositionPlayerCardSize.nameSize,
              family: FontFamily.ARIAL,
              weight: FontWeight.bold
          ),
          Container(
              height: CompositionPlayerCardSize.heightArtifacts,
              padding: EdgeInsets.only(top: 1.0),
              child: _buildPlayerArtifacts()
          )
        ],
      ),
    );
  }

  Widget _buildPlayerArtifacts() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: nbGoal > 2 ? _buildArtifactsWithTooManyGoals()
            : _buildArtifacts()
    );
  }

  _buildArtifactsWithTooManyGoals() {
    return [
      _buildGoal(),
      Padding(
        padding: const EdgeInsets.only(right: 1.0),
        child: buildWidgetText(
            text: " x" + nbGoal.toString(),
            family: FontFamily.ARIAL,
            weight: FontWeight.bold,
            size: CompositionPlayerCardSize.goalTextSize
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
    return nbGoal > 0 ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(nbGoal, (int i) =>
            _buildGoal()).toList(),
      ),
    ) : SizedBox.shrink();
  }

  Widget _buildYellowCards() {
    return nbYellowCard > 0 ? Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(nbYellowCard, (int i) =>
            _buildYellowCard()).toList(),
      ),
    ) : SizedBox.shrink();
  }

  Widget _buildGoal() {
    return Image.asset(
      "assets/img/ball.png",
      width: CompositionPlayerCardSize.sizeGoal,
      height: CompositionPlayerCardSize.sizeGoal,
    );
  }

  Widget _buildYellowCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Image.asset(
        "assets/img/yellow_card.png",
        width: CompositionPlayerCardSize.widthYellowCard,
        height: CompositionPlayerCardSize.heightYellowCard,
      ),
    );
  }
}
