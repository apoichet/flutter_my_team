import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/domain/player.dart';

class IndividualStatisticsCard extends StatefulWidget {
  final Player playerSelected;
  IndividualStatisticsCard({
    this.playerSelected,
  });

  @override
  _IndividualStatisticsCardState createState() => _IndividualStatisticsCardState();
}

class _IndividualStatisticsCardState extends State<IndividualStatisticsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Text(widget.playerSelected.firstName)
        ),
        Expanded(
            child: Text(widget.playerSelected.firstName)
        ),
        Expanded(
            flex: 6,
            child: Text(widget.playerSelected.firstName)
        )
      ],
    );
  }
}
