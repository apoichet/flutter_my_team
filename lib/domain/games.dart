import 'game.dart';

class Games {

  final List<Game> gameList;

  Games(this.gameList);

  Game getNextGame() {
    return gameList
        .firstWhere(
            (game) => game.isAfter(Duration(minutes: 60)),
        orElse: () => gameList.last);
  }

}
