import 'package:my_team/domain/player.dart';

class CollectiveStatisticsResult {
  final Player player;
  final double value;
  final String valueStr;
  CollectiveStatisticsResult(
      {
        this.player,
        this.value,
        this.valueStr
      });
}
