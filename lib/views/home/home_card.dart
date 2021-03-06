import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/player_avatar.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/domain/team.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/home/home_charts.dart';
import 'package:fc_parisii/views/statistics/individual/individual_statistics.dart';


class IndividualCard extends StatelessWidget {

  final Team team;
  final Player player;

  IndividualCard({Key key, this.team, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: _buildHeader(context)
        ),
        Expanded(
            flex: 5,
            child: _buildHomeCharts()
        ),
        Expanded(
          flex: 1,
          child: _buildTapNameFooter(context),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getResponsiveWidth(15.0),
          right: getResponsiveWidth(10.0),
          top: getResponsiveHeight(10.0)
      ),
      child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PlayerAvatar(
                  player: player,
                  scale: 1,
                  transform: Matrix4.translationValues(0, 0, 0),
                  blurRadius: 6.0,
                  yBlur: 3.0,
                  shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
              ),
            ),
            Expanded(
                flex: 7,
                child: _buildHeaderTitleCard()
            ),
          ]),
    );
  }

  Widget _buildTapNameFooter(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, buildNoAnimationRoute(IndividualStatistics(player)));
      },
      child: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: Colors.white
              ),
              borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildWidgetText(
                fontSize: getResponsiveHeight(21.0),
                text: player.firstName + " ",
                family: FontFamily.ARIAL,
              ),
              buildWidgetText(
                  fontSize: getResponsiveHeight(21.0),
                  text: player.lastName,
                  family: FontFamily.ARIAL,
                  weight: FontWeight.bold
              )
            ],
          )
      ),
    );
  }

  _buildHeaderTitleCard() {
    return Column(
      children: <Widget>[
        Expanded(
            child: Center(
              child: buildWidgetText(
                  text: player.nickName + " - N " + player.number.toString(),
                  fontSize: getResponsiveWidth(26.0),
                  family: FontFamily.ARIAL,
                  weight: FontWeight.bold,
                  color: Colors.white
              ),
            )
        ),
        Expanded(
          child: Center(
            child: buildWidgetText(
                text: player.position,
                fontSize: getResponsiveWidth(20.0),
                family: FontFamily.ARIAL,
                weight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        )
      ],
    );
  }

  Widget _buildHomeCharts() {
    return HomeCharts(
      team: team,
      player: player,
    );
  }

}


