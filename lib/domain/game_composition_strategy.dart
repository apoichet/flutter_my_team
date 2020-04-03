enum GameCompositionStrategy {
  THREE_FIVE_TWO,
  FOUR_FOUR_TWO,
  FOUR_THREE_THREE,
  FOUR_TWO_THREE_ONE,
  FOUR_THREE_ONE_TWO,
  THREE_FOUR_THREE,
  FIVE_THREE_TWO
}

GameCompositionStrategy strategyFrom(String strategy) {
  switch (strategy) {
    case "3 - 5 - 2" : return GameCompositionStrategy.THREE_FIVE_TWO;
    case "4 - 4 - 2" : return GameCompositionStrategy.FOUR_FOUR_TWO;
    case "4 - 3 - 3" : return GameCompositionStrategy.FOUR_THREE_THREE;
    case "4 - 2 - 3 - 1" : return GameCompositionStrategy.FOUR_TWO_THREE_ONE;
    case "4 - 3 - 1 - 2" : return GameCompositionStrategy.FOUR_THREE_ONE_TWO;
    case "3 - 4 - 3" : return GameCompositionStrategy.THREE_FOUR_THREE;
    case "5 - 3 - 2" : return GameCompositionStrategy.FIVE_THREE_TWO;
  }
  return GameCompositionStrategy.FOUR_FOUR_TWO;
}
