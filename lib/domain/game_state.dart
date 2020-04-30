enum GameState {
  VICTORY, DEFEAT, DRAW
}

GameState from(String state) {
  return GameState.values.firstWhere((g) => g.toString() == state);
}

GameState fromGameState(String state) {
  switch (state) {
    case 'Gagné' : return GameState.VICTORY;
    case 'Perdu' : return GameState.DEFEAT;
    case 'Egalité' : return GameState.DRAW;
  }
  return null;
}

String toGameState(GameState state) {
  switch (state) {
    case GameState.VICTORY : return "Victoire";
    case GameState.DEFEAT : return "Défaite";
    case GameState.DRAW : return "Egalité";
  }
  return "";
}
