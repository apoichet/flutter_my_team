import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/header_card.dart';
import 'package:my_team/components/player_avatar.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/domain/team.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/home/home_charts.dart';

class IndividualCard extends StatefulWidget {
  final Team team;
  final Player player;

  const IndividualCard({Key key, this.team, this.player}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndividualCardState();
}

class _IndividualCardState extends State<IndividualCard> {

  Widget _charts;

  @override
  void initState() {
    _charts = _buildCharts();
    super.initState();
  }

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
          child: _charts
        ),
        Expanded(
          flex: 1,
          child: _buildTapNameFooter(),
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
            PlayerAvatar(
                player: player,
                scale: 1,
                transform: Matrix4.translationValues(0, 0, 0),
                blurRadius: 6.0,
                yBlur: 3.0,
                shadowColor: Color.fromRGBO(0, 0, 0, 0.7)
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: getResponsiveWidth(15.0)
                ),
                child: HeaderCard(
                  player: player,
                  fontSize: 20.0,
                ),
              ),
            ),
          ]),
    );
  }

  Widget _buildTapNameFooter() {
    return GestureDetector(
      onDoubleTap: _doubleTap,
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

  void _doubleTap() {
    setState(() {
      _charts = _buildCharts();
    });
  }

  Widget _buildCharts() {
    return HomeCharts(
      team: widget.team,
      player: widget.player,
    );
  }

}


