import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/components/player_avatar.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getResponsiveWidth(5.0),
                  vertical: getResponsiveHeight(10.0)
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: PlayerAvatar(
                      player: widget.playerSelected,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildWidgetText(
                        text: widget.playerSelected.position + "\n" +
                        "Numéro " + widget.playerSelected.number.toString(),
                      fontSize: getResponsiveSize(25.0),
                      family: FontFamily.ARIAL,
                      weight: FontWeight.bold
                    ),
                  )
                ],
              ),
            )
        ),
        Expanded(
            child: Text(widget.playerSelected.firstName)
        ),
        Expanded(
            flex: 7,
            child: Text(widget.playerSelected.firstName)
        )
      ],
    );
  }
}
