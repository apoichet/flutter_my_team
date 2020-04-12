import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/header_card.dart';
import 'package:my_team/components/player_avatar.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/statistics/individual/topics/topic_flop.dart';
import 'package:my_team/views/statistics/individual/topics/topic_goal_opponent.dart';
import 'package:my_team/views/statistics/individual/topics/topic_goal_pass.dart';
import 'package:my_team/views/statistics/individual/topics/topic_game.dart';

class IndividualStatisticsCard extends StatefulWidget {
  final Player playerSelected;
  final int indexChart;
  IndividualStatisticsCard({
    this.playerSelected,
    this.indexChart = 0
  });

  @override
  _IndividualStatisticsCardState createState() => _IndividualStatisticsCardState();
}

class _IndividualStatisticsCardState extends State<IndividualStatisticsCard> {
  PageController _controller;
  List<Topic> topics;
  int _indexChart;
  int _indexPreviousChart;
  int _indexNextChart;

  @override
  void initState() {
    topics = [
      new Topic("Buts/Passes", TopicGoalPass(widget.playerSelected)),
      new Topic("Encaissés", TopicGoalOpponent(widget.playerSelected)),
      new Topic("Positions",  Text("")),
      new Topic("Matchs",  TopicGame(widget.playerSelected)),
      new Topic("Flops",  TopicFlop(widget.playerSelected))
    ];
    _controller = PageController(
        initialPage: widget.indexChart,
        keepPage: true
    );
    _indexChart = widget.indexChart;
    _indexPreviousChart = _getIndexPrevious();
    _indexNextChart = _getIndexNext();

    super.initState();
  }

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
                    child: HeaderCard(
                      player: widget.playerSelected,
                      fontSize: 20.0,
                    )
                  )
                ],
              ),
            )
        ),
        Expanded(
            child: Container(
                color: Color.fromRGBO(175, 175, 175, 0.9),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () => _onChartChanged(_indexChart - 1),
                        child: buildWidgetText(
                          text: topics[_indexPreviousChart].title,
                          fontSize: getResponsiveSize(14.0),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: buildWidgetText(
                          text: topics[_indexChart].title,
                          fontSize: getResponsiveSize(18.0),
                          weight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () => _onChartChanged(_indexChart + 1),
                        child: buildWidgetText(
                            text: topics[_indexNextChart].title,
                            fontSize: getResponsiveSize(14.0)
                        ),
                      ),
                    )
                  ],
                )
            )
        ),
        Expanded(
            flex: 7,
            child: PageView.builder(
              controller: _controller,
              itemBuilder: (_, int index) => topics.map((t) =>
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: t.body
                  )
              ).toList()[_indexChart],
              onPageChanged: (index) {
                _onChartChanged(index);
              },
            )
        )
      ],
    );
  }

  _getIndexPrevious() {
    var indexPrevious = _indexChart - 1;
    if(indexPrevious < 0) {
      return topics.length - 1;
    }
    return indexPrevious;
  }

  _getIndexNext() {
    var indexNext = _indexChart + 1;
    if(indexNext >= topics.length) {
      return 0;
    }
    return indexNext;
  }

  _onChartChanged(index) {
    setState(() {
      _indexChart = index%topics.length;
      _indexPreviousChart = _getIndexPrevious();
      _indexNextChart = _getIndexNext();
    });
  }

}

class Topic {
  final String title;
  final Widget body;

  Topic(this.title, this.body);
}
