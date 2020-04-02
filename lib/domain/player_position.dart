enum PlayerPosition {
  GOAL_KEEPER,
  RIGHT_BACK,
  LEFT_BACK,
  RIGHT_DEFENDER,
  LEFT_DEFENDER,
  CENTER_BACK,
  CENTER_BACK_RIGHT,
  CENTER_BACK_LEFT,
  DEFENSIVE_MIDFIELDER,
  DEFENSIVE_MIDFIELDER_LEFT,
  DEFENSIVE_MIDFIELDER_RIGHT,
  OFFENSIVE_MIDFIELDER,
  PLAY_MAKER,
  SIDE_MIDFIELDER_RIGHT,
  SIDE_MIDFIELDER_LEFT,
  WINGER_RIGHT,
  WINGER_LEFT,
  FORWARD,
  SECOND_TOP,
  CENTER_FORWARD,
  SUBSTITUTE,
  UNKNOWN
}

PlayerPosition from(String position) {
  switch(position) {
    case "Gardien" : return PlayerPosition.GOAL_KEEPER;
    case "Latéral Droit" : return PlayerPosition.RIGHT_BACK;
    case "Latéral Gauche" : return PlayerPosition.LEFT_BACK;
    case "Défenseur Gauche" : return PlayerPosition.LEFT_DEFENDER;
    case "Défenseur Droit" : return PlayerPosition.RIGHT_DEFENDER;
    case "Défenseur Central" : return PlayerPosition.CENTER_BACK;
    case "Défenseur Central Gauche" : return PlayerPosition.CENTER_BACK_LEFT;
    case "Défenseur Central Droit" : return PlayerPosition.CENTER_BACK_RIGHT;
    case "Milieu Défensif" : return PlayerPosition.DEFENSIVE_MIDFIELDER;
    case "Milieu Défensif Gauche" : return PlayerPosition.DEFENSIVE_MIDFIELDER_LEFT;
    case "Milieu Défensif Droit" : return PlayerPosition.DEFENSIVE_MIDFIELDER_RIGHT;
    case "Milieu Offensif" : return PlayerPosition.OFFENSIVE_MIDFIELDER;
    case "Meneur de Jeu" : return PlayerPosition.PLAY_MAKER;
    case "Milieu Gauche" : return PlayerPosition.SIDE_MIDFIELDER_LEFT;
    case "Milieu Droit" : return PlayerPosition.SIDE_MIDFIELDER_RIGHT;
    case "Ailier Gauche" : return PlayerPosition.WINGER_LEFT;
    case "Ailier Droit" : return PlayerPosition.WINGER_RIGHT;
    case "Attaquant" : return PlayerPosition.FORWARD;
    case "Second Attaquant" : return PlayerPosition.SECOND_TOP;
    case "Avant Centre" : return PlayerPosition.CENTER_FORWARD;
    case "Remplaçant" : return PlayerPosition.SUBSTITUTE;
  }
  return PlayerPosition.UNKNOWN;
}

String to(PlayerPosition position) {
  switch(position) {
    case PlayerPosition.GOAL_KEEPER : return "Gardien";
    case PlayerPosition.RIGHT_BACK : return "Latéral Droit";
    case PlayerPosition.LEFT_BACK : return "Latéral Gauche";
    case PlayerPosition.RIGHT_DEFENDER : return "Défenseur Droit";
    case PlayerPosition.LEFT_DEFENDER : return "Défenseur Gauche";
    case PlayerPosition.CENTER_BACK : return "Défenseur Central";
    case PlayerPosition.CENTER_BACK_LEFT : return "Défenseur Central Gauche";
    case PlayerPosition.CENTER_BACK_RIGHT : return "Défenseur Central Droit";
    case PlayerPosition.DEFENSIVE_MIDFIELDER : return "Milieu Défensif";
    case PlayerPosition.DEFENSIVE_MIDFIELDER_LEFT : return "Milieu Défensif Gauche";
    case PlayerPosition.DEFENSIVE_MIDFIELDER_RIGHT : return "Milieu Défensif Droit";
    case PlayerPosition.OFFENSIVE_MIDFIELDER : return "Milieu Offensif";
    case PlayerPosition.PLAY_MAKER : return "Meneur de Jeu";
    case PlayerPosition.SIDE_MIDFIELDER_LEFT : return "Milieu Gauche";
    case PlayerPosition.SIDE_MIDFIELDER_RIGHT : return "Milieu Droit";
    case PlayerPosition.WINGER_LEFT : return "Ailier Gauche";
    case PlayerPosition.WINGER_RIGHT : return "Ailier Droit";
    case PlayerPosition.FORWARD : return "Attaquant";
    case PlayerPosition.SECOND_TOP : return "Second Attaquant";
    case PlayerPosition.CENTER_FORWARD : return "Avant Centre";
    case PlayerPosition.SUBSTITUTE : return "Remplaçant";
    case PlayerPosition.UNKNOWN : return "Autres";
  }
  return "";
}
