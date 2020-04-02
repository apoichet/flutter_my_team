import 'package:flutter/widgets.dart';
import 'package:my_team/const/composition_player_card_size.dart';
import 'package:my_team/domain/player_position.dart';


class PlayerPositionEngine {

  final double mapHeight;
  final double mapWidth;
  final double cardHeight;
  final double cardWidth;

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

      );
      case PlayerPosition.RIGHT_BACK : return PlayerPhysicPosition(

      );
      case PlayerPosition.LEFT_BACK : return PlayerPhysicPosition(

      );
      case PlayerPosition.CENTER_BACK : return PlayerPhysicPosition(

      );
      case PlayerPosition.CENTER_BACK_LEFT : return PlayerPhysicPosition(

      );
      case PlayerPosition.CENTER_BACK_RIGHT : return PlayerPhysicPosition(

      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER : return PlayerPhysicPosition(

      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER_LEFT : return PlayerPhysicPosition(

      );
      case PlayerPosition.DEFENSIVE_MIDFIELDER_RIGHT : return PlayerPhysicPosition(

      );
      case PlayerPosition.OFFENSIVE_MIDFIELDER : return PlayerPhysicPosition(

      );
      case PlayerPosition.PLAY_MAKER : return PlayerPhysicPosition(

      );
      case PlayerPosition.SIDE_MIDFIELDER_LEFT : return PlayerPhysicPosition(

      );
      case PlayerPosition.SIDE_MIDFIELDER_RIGHT : return PlayerPhysicPosition(

      );
      case PlayerPosition.WINGER_LEFT : return PlayerPhysicPosition(

      );
      case PlayerPosition.WINGER_RIGHT : return PlayerPhysicPosition(

      );
      case PlayerPosition.FORWARD : return PlayerPhysicPosition(

      );
      case PlayerPosition.SECOND_TOP : return PlayerPhysicPosition(

      );
      case PlayerPosition.CENTER_FORWARD : return PlayerPhysicPosition(

      );
      case PlayerPosition.SUBSTITUTE : return PlayerPhysicPosition(

      );
      case PlayerPosition.UNKNOWN : return PlayerPhysicPosition(

      );
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
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0
  });
}
