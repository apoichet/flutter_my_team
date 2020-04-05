import 'package:flutter/widgets.dart';
import 'package:my_team/const/composition_player_card_size.dart';
import 'package:my_team/domain/game_composition_strategy.dart';
import 'package:my_team/domain/player_position.dart';
import 'package:my_team/services/responsive_size.dart';


class PlayerPositionEngine {

  final double mapHeight;
  final double mapWidth;
  final double cardHeight = getResponsiveWidth(CompositionPlayerCardSize.heightPlayer);
  final double cardWidth  = getResponsiveWidth(CompositionPlayerCardSize.widthPlayer);
  final GameCompositionStrategy strategy;

  final double factorLine = 1.07;

  PlayerPositionEngine({
    @required this.mapHeight,
    @required this.mapWidth,
    @required this.strategy,
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
          bottom: cardHeight * 2.1 * factorLine,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER_LEFT : return PlayerPhysicPosition(
          bottom: cardHeight * 2.1 * factorLine,
          left: mapWidth/2 - cardWidth
      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER_RIGHT : return PlayerPhysicPosition(
          bottom: cardHeight * 2.1 * factorLine,
          right: mapWidth/2 - cardWidth
      );
      case PlayerPosition.OFFENSIVE_MIDFIELDER : return PlayerPhysicPosition(
          bottom: cardHeight * 3 * factorLine,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.PLAY_MAKER : return PlayerPhysicPosition(
          bottom: cardHeight * 3 * factorLine,
          left: mapWidth/2 - cardWidth/2
      );
      case PlayerPosition.SIDE_MIDFIELDER_LEFT : return PlayerPhysicPosition(
          bottom: cardHeight * 2.6 * factorLine,
          left: cardWidth/6
      );
      case PlayerPosition.SIDE_MIDFIELDER_RIGHT : return PlayerPhysicPosition(
          bottom: cardHeight * 2.6 * factorLine,
          right: cardWidth/6
      );
      case PlayerPosition.WINGER_LEFT : return PlayerPhysicPosition(
          bottom: cardHeight * 3.2 * factorLine,
          left: cardWidth/6
      );
      case PlayerPosition.WINGER_RIGHT : return PlayerPhysicPosition(
          bottom: cardHeight * 3.2 * factorLine,
          right: cardWidth/6
      );
      case PlayerPosition.FORWARD :
        if(strategy == GameCompositionStrategy.FOUR_FOUR_TWO) {
          return PlayerPhysicPosition(
              bottom: cardHeight * 3.5 * factorLine,
              left: mapWidth/2 - cardWidth);
        }
        return PlayerPhysicPosition(
          bottom: cardHeight * 4 * factorLine,
          left: mapWidth/2 - cardWidth
      );
      case PlayerPosition.SECOND_TOP :
        if(strategy == GameCompositionStrategy.FOUR_FOUR_TWO) {
          return PlayerPhysicPosition(
              bottom: cardHeight * 3.5 * factorLine,
              right: mapWidth/2 - cardWidth);
        }
        return PlayerPhysicPosition(
          bottom: cardHeight * 4 * factorLine,
          right: mapWidth/2 - cardWidth
      );
      case PlayerPosition.CENTER_FORWARD : return PlayerPhysicPosition(
          bottom: cardHeight * 4 * factorLine,
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
