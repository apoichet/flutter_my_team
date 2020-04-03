enum PlayerGameState {

  STARTERS, SUBSTITUTE, HURT, ABSENT, AT_REST, UNKNOWN

}

PlayerGameState playerGameStateFrom(String state) {
  switch (state) {
    case "Absent" : return PlayerGameState.ABSENT;
    case "Titulaire" : return PlayerGameState.STARTERS;
    case "Remplaçant" : return PlayerGameState.SUBSTITUTE;
    case "Blessé" : return PlayerGameState.HURT;
    case "Repos" : return PlayerGameState.AT_REST;
  }
  return PlayerGameState.UNKNOWN;
}
