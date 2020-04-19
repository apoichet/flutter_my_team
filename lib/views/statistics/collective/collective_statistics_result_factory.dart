import 'package:flutter/cupertino.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/number_service.dart';
import 'package:my_team/views/statistics/collective/collective_statistics_card_result.dart';
import 'package:my_team/views/statistics/collective/collective_statistics_result.dart';

Widget buildCardResult(CollectiveStatisticsEnum collectiveStatisticsEnum) {

  String unit;
  CollectiveStatisticsResult Function(Player player) playerToResult;

  switch (collectiveStatisticsEnum) {
    case CollectiveStatisticsEnum.GOAL : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrGoal.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Buts";
      break;
    }
    case CollectiveStatisticsEnum.PASS : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrPass.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Passes Décisives";
      break;
    }
    case CollectiveStatisticsEnum.GOAL_PER_MATCH : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrGoal / player.nbrGame,
          nbrRoundDecimal: 2);
      unit = "Buts / Match";
      break;
    }
    case CollectiveStatisticsEnum.PASS_PER_MATCH : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrPass / player.nbrGame,
          nbrRoundDecimal: 2);
      unit = "Passes D / Match";
      break;
    }
    case CollectiveStatisticsEnum.DECISIVE_PER_MATCH : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrPass / player.nbrGame + player.nbrGoal / player.nbrGame,
          nbrRoundDecimal: 2);
      unit = "Décisif / Match";
      break;
    }
    case CollectiveStatisticsEnum.GAME : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrGame.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Matchs";
      break;
    }
    case CollectiveStatisticsEnum.GAME_TIME : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.gameTime.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Minutes de Jeux";
      break;
    }
    case CollectiveStatisticsEnum.STARTER : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrStarter.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Titulaires";
      break;
    }
    case CollectiveStatisticsEnum.TIME_PER_GAME : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.gameTime / player.nbrGame,
          nbrRoundDecimal: 0);
      unit = "Minutes / Match";
      break;
    }
    case CollectiveStatisticsEnum.SUBSTITUTE : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrSubstitute.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Remplaçant";
      break;
    }
    case CollectiveStatisticsEnum.GOAL_OPPONENT_COLLECTED : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrGoalOpponent.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Buts Encaissés";
      break;
    }
    case CollectiveStatisticsEnum.CLEAN_SHEET : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrCleanSheet.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Clean Sheet";
      break;
    }
    case CollectiveStatisticsEnum.GOAL_OPPONENT_COLLECTED_PER_MATCH : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrGoalOpponent /player.nbrGame,
          nbrRoundDecimal: 2);
      unit = "Buts Encaissés / Match";
      break;
    }
    case CollectiveStatisticsEnum.PENALTY_OPPONENT_COLLECTED : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrOpponentGoalPenaltyCollected.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Penalty Encaissé";
      break;
    }
    case CollectiveStatisticsEnum.FREE_KICK_OPPONENT_COLLECTED : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrOpponentGoalCornerFreeKickCollected.toDouble(),
          nbrRoundDecimal: 0);
      unit = "CF et Corner Encaissés";
      break;
    }
    case CollectiveStatisticsEnum.YELLOW_CARD : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrYellowCard.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Carton Jaune";
      break;
    }
    case CollectiveStatisticsEnum.LATE_TIME : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.lateTime.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Minutes de retard";
      break;
    }
    case CollectiveStatisticsEnum.ABSENT : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrAbsent.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Absent";
      break;
    }
    case CollectiveStatisticsEnum.REST : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrRest.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Mise au repos";
      break;
    }
    case CollectiveStatisticsEnum.HURT : {
      playerToResult = (Player player) => _buildResult(player,
          value: player.nbrHurt.toDouble(),
          nbrRoundDecimal: 0);
      unit = "Semaines Blessé";
      break;
    }
  }

  List<CollectiveStatisticsResult> results = getTeam().players
      .map(playerToResult)
      .toList();
  results.sort((r1, r2) => r2.value.compareTo(r1.value));

  return CollectiveStatisticsCardResult(
    podiumResults: results.sublist(0, 3),
    restResults: results.sublist(3),
    unit: unit,
  );
}

CollectiveStatisticsResult _buildResult(Player player, {double value, int nbrRoundDecimal}) {
  return CollectiveStatisticsResult(
      name: player.firstName + " " + player.lastName,
      avatar: player.avatar,
      value: value,
      valueStr: roundDoubleToString(value, nbrRoundDecimal)
  );
}


enum CollectiveStatisticsEnum {
  GOAL,
  PASS,
  GOAL_PER_MATCH,
  PASS_PER_MATCH,
  DECISIVE_PER_MATCH,
  GAME,
  GAME_TIME,
  STARTER,
  TIME_PER_GAME,
  SUBSTITUTE,
  GOAL_OPPONENT_COLLECTED,
  CLEAN_SHEET,
  GOAL_OPPONENT_COLLECTED_PER_MATCH,
  PENALTY_OPPONENT_COLLECTED,
  FREE_KICK_OPPONENT_COLLECTED,
  YELLOW_CARD,
  LATE_TIME,
  ABSENT,
  REST,
  HURT
}
