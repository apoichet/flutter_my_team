import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/header_card.dart';
import 'package:my_team/components/player_avatar.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/views/statistics/individual/topics/topic_flop.dart';
import 'package:my_team/views/statistics/individual/topics/topic_game.dart';
import 'package:my_team/views/statistics/individual/topics/topic_goal_opponent.dart';
import 'package:my_team/views/statistics/individual/topics/topic_goal_pass.dart';
import 'package:my_team/views/statistics/individual/topics/topic_position.dart';

class IndividualStatisticsCard extends StatefulWidget {
  final Player playerSelected;
  final int indexChart;
  final List<String> titleTopics;
  IndividualStatisticsCard({
    @required this.titleTopics,
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
      new Topic(widget.titleTopics[0], TopicGoalPass(widget.playerSelected)),
      new Topic(widget.titleTopics[1], TopicGoalOpponent(widget.playerSelected)),
      new Topic("Positions",  TopicPosition(widget.playerSelected.gamePositions)),
      new Topic(widget.titleTopics[2],  TopicGame(widget.playerSelected)),
      new Topic(widget.titleTopics[3],  TopicFlop(widget.playerSelected))
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
                      child: _indexChart != 0 ?
                      GestureDetector(
                        onTap: () => _onChartChanged(_indexChart - 1),
                        child: buildWidgetText(
                          text: topics[_indexPreviousChart].title,
                          fontSize: getResponsiveWidth(14.0),
                        ),
                      ) : SizedBox.shrink(),
                    ),
                    Expanded(
                      flex: 3,
                      child: buildWidgetText(
                          text: topics[_indexChart].title,
                          fontSize: getResponsiveWidth(18.0),
                          weight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: _indexChart != topics.length - 1 ?
                      GestureDetector(
                        onTap: () => _onChartChanged(_indexChart + 1),
                        child: buildWidgetText(
                            text: topics[_indexNextChart].title,
                            fontSize: getResponsiveWidth(14.0)
                        ),
                      ) : SizedBox.shrink(),
                    )
                  ],
                )
            )
        ),
        Expanded(
            flex: 7,
            child: PageView(
                controller: _controller,
                children: topics.map((t) =>
                    Padding(
                        padding: EdgeInsets.all(getResponsiveSize(8.0)),
                        child: t.body
                    )
                ).toList(),
                onPageChanged: (index) {
                  _onChartChanged(index);
                }
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
      _indexChart = index;
      _controller.jumpToPage(_indexChart);
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
