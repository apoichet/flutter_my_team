enum GameState {
  VICTORY, DEFEAT, DRAW
}

GameState from(String state) {
  return GameState.values.firstWhere((g) => g.toString() == state);
}

GameState evaluate(String state) {
  switch (state) {
    case 'Gagné' : return GameState.VICTORY;
    case 'Perdu' : return GameState.DEFEAT;
    case 'Egalité' : return GameState.DRAW;
  }
  throw new Exception("No game state found !");
}

String reverseEvaluate(GameState state) {
  switch (state) {
    case GameState.VICTORY : return "Victoire";
    case GameState.DEFEAT : return "Défaite";
    case GameState.DRAW : return "Egalité";
  }


}
