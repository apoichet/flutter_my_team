import 'package:flutter/widgets.dart';
import 'package:my_team/const/composition_player_card_size.dart';
import 'package:my_team/domain/player_position.dart';


class PlayerPositionEngine {

  final double mapHeight;
  final double mapWidth;
  final double cardHeight;
  final double cardWidth;

  final double factorLine = 1.08;

  const PlayerPositionEngine({
    @required this.mapHeight,
    @required this.mapWidth,
    this.cardHeight = CompositionPlayerCardSize.heightPlayer,
    this.cardWidth = CompositionPlayerCardSize.widthPlayer,
  });

  PlayerPhysicPosition buildCompositionPlayerFrom({
    @required PlayerPosition position,
  }) {
    switch(position) {
      case PlayerPosition.GOAL_KEEPER : return PlayerPhysicPosition(
          bottom: 0,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.RIGHT_BACK : return PlayerPhysicPosition(
          bottom: cardHeight * 1.5 * factorLine,
          right: cardWidth/6
      );
      case PlayerPosition.LEFT_BACK : return PlayerPhysicPosition(
          bottom: cardHeight * 1.5 * factorLine,
          left: cardWidth/6
      );
      case PlayerPosition.RIGHT_DEFENDER : return PlayerPhysicPosition(
          bottom: cardHeight * factorLine,
          right: mapWidth/6
      );
      case PlayerPosition.LEFT_DEFENDER : return PlayerPhysicPosition(
          bottom: cardHeight * factorLine,
          left: mapWidth/6
      );
      case PlayerPosition.CENTER_BACK : return PlayerPhysicPosition(
          bottom: cardHeight * factorLine,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.CENTER_BACK_LEFT : return PlayerPhysicPosition(
          bottom: cardHeight * factorLine,
          left: mapWidth/4
      );
      case PlayerPosition.CENTER_BACK_RIGHT : return PlayerPhysicPosition(
          bottom: cardHeight * factorLine,
          right: mapWidth/4
      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER : return PlayerPhysicPosition(
          bottom: cardHeight * 2 * factorLine,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER_LEFT : return PlayerPhysicPosition(
          bottom: cardHeight * 2 * factorLine,
          left: mapWidth/2 - cardWidth
      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER_RIGHT : return PlayerPhysicPosition(
          bottom: cardHeight * 2 * factorLine,
          right: mapWidth/2 - cardWidth
      );
      case PlayerPosition.OFFENSIVE_MIDFIELDER : return PlayerPhysicPosition(
          bottom: cardHeight * 2.85 * factorLine,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.PLAY_MAKER : return PlayerPhysicPosition(
          bottom: cardHeight * 2.85 * factorLine,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.SIDE_MIDFIELDER_LEFT : return PlayerPhysicPosition(
          bottom: cardHeight * 2.5 * factorLine,
          left: cardWidth/6
      );
      case PlayerPosition.SIDE_MIDFIELDER_RIGHT : return PlayerPhysicPosition(
          bottom: cardHeight * 2.5 * factorLine,
          right: cardWidth/6
      );
      case PlayerPosition.WINGER_LEFT : return PlayerPhysicPosition(
          bottom: cardHeight * 3 * factorLine,
          left: cardWidth/6
      );
      case PlayerPosition.WINGER_RIGHT : return PlayerPhysicPosition(
          bottom: cardHeight * 3 * factorLine,
          right: cardWidth/6
      );
      case PlayerPosition.FORWARD : return PlayerPhysicPosition(
          bottom: cardHeight * 3.2 * factorLine,
          left: mapWidth/2 - cardWidth
      );
      case PlayerPosition.SECOND_TOP : return PlayerPhysicPosition(
          bottom: cardHeight * 3.2 * factorLine,
          right: mapWidth/2 - cardWidth
      );
      case PlayerPosition.CENTER_FORWARD : return PlayerPhysicPosition(
          bottom: cardHeight * 3.8 * factorLine,
          right: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.UNKNOWN :throw new Exception("UNKNOWN Player position detected");
    }
    return PlayerPhysicPosition();
  }
}

class PlayerPhysicPosition {

  final double top;
  final double bottom;
  final double left;
  final double right;

  PlayerPhysicPosition({
    this.top,
    this.bottom,
    this.left,
    this.right
  });
}
