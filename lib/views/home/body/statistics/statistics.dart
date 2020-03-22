import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/theme/colors.dart';

class _StatisticsState extends State<Statistics> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: _buildHeader()
        ),
        Expanded(
            child: _buildTopics()
        ),
        Expanded(
          flex: 8,
            child: FittedBox(
              child: _buildSwipe(),
            )
        )

      ],
    );
  }

  _buildHeader() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CustomColors.BlueChartTransparent,
        borderRadius: BorderRadius.circular(50)
      ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text('Satistiques', style: Theme.of(context).textTheme.caption)
    );
  }

  _buildTopics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Individuel', style: Theme.of(context).textTheme.caption),
        Text('Collectives', style: Theme.of(context).textTheme.caption)
      ]
    );
  }

  _buildSwipe() {
    /*return Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
              BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColors.PinkChartTransparent,
              ),

            ),
          );
        },
        itemCount: 2
    );*/

  }

}

class Statistics extends StatefulWidget {

  final List<Player> players;

  const Statistics({Key key, @required this.players}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatisticsState();
}
