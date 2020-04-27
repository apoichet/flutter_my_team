enum GameType {
  FRIENDLY, CHAMPIONSHIP, CUP
}

GameType fromGameType(String gameType) {
  switch (gameType) {
    case "Amical" : return GameType.FRIENDLY;
    case "Championnat" : return GameType.CHAMPIONSHIP;
    case "Coupe" : return GameType.CUP;
  }
  return null;
}

String toGameType(GameType gameType) {
  switch (gameType) {
    case GameType.FRIENDLY : return "Amical";
    case GameType.CHAMPIONSHIP : return "Championnat";
    case GameType.CUP : return "Coupe";
  }
  return "";
}
