import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/circle.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

import 'collective_statistics_card.dart';
import 'collective_statistics_result_factory.dart';

class CollectiveStatisticsPageView extends StatefulWidget {

  final List<String> topics;
  final int indexTopic;

  const CollectiveStatisticsPageView({Key key, this.topics, this.indexTopic}) : super(key: key);

  @override
  _CollectiveStatisticsPageViewState createState() => _CollectiveStatisticsPageViewState();
}

class _CollectiveStatisticsPageViewState extends State<CollectiveStatisticsPageView> {

  int _indexPrevious;
  int _indexNext;
  int _index;
  PageController _controller;
  List<CollectiveStatisticsCard> _cards;

  @override
  void initState() {
    _controller = new PageController(
      initialPage: widget.indexTopic,
    );
    _index = widget.indexTopic;
    _indexPrevious = _index - 1;
    _indexNext = _index + 1;
    _cards = _buildCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: _buildTopics()
        ),
        Expanded(
            flex: 8,
            child: _buildPageView()
        ),
        Expanded(
            child: _buildFooter()
        )
      ],
    );
  }

  Widget _buildTopics() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(2.0)
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _indexPrevious >= 0 ? GestureDetector(
                onTap: () => _pageChanged(_index - 1),
                child: buildWidgetText(
                    text: widget.topics[_indexPrevious],
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: getResponsiveWidth(16.0),
                    color: Color.fromRGBO(90, 90, 90, 1)
                ),
              ) : SizedBox.shrink(),
            ),
            Expanded(
                flex: 3,
                child: buildWidgetText(
                    text: widget.topics[_index],
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: getResponsiveWidth(22.0)
                )
            ),
            Expanded(
              flex: 2,
              child: _indexNext < widget.topics.length ? GestureDetector(
                onTap: () => _pageChanged(_index + 1),
                child: buildWidgetText(
                    text: widget.topics[_indexNext],
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: getResponsiveWidth(16.0),
                    color: Color.fromRGBO(90, 90, 90, 1)
                ),
              ) : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
        physics: ClampingScrollPhysics(),
        controller: _controller,
        onPageChanged: _onPageChanged,
        children: _cards
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.topics
          .map((topic) =>
          Circle(
              full: _index == widget.topics.indexOf(topic) ? true : false,
              size: 10.0,
              colorFull: Color.fromRGBO(116, 116, 116, 1.0),
              colorEmpty: Colors.white
          )
      ).toList(),
    );
  }

  _pageChanged(int index) {
    setState(() {
      _index = index;
      _controller.jumpToPage(_index);
      _indexNext = _index + 1;
      _indexPrevious = _index - 1;
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _index = index;
      _indexNext = _index + 1;
      _indexPrevious = _index - 1;
    });
  }

  List<CollectiveStatisticsCard> _buildCards() {
    return [
      CollectiveStatisticsCard([
        CollectiveStatisticsEnum.GOAL,
        CollectiveStatisticsEnum.PASS,
        CollectiveStatisticsEnum.GOAL_PER_MATCH,
        CollectiveStatisticsEnum.PASS_PER_MATCH,
        CollectiveStatisticsEnum.DECISIVE_PER_MATCH
      ]),
      CollectiveStatisticsCard([
        CollectiveStatisticsEnum.GOAL_OPPONENT_COLLECTED,
        CollectiveStatisticsEnum.GOAL_OPPONENT_COLLECTED_PER_MATCH,
        CollectiveStatisticsEnum.CLEAN_SHEET,
        CollectiveStatisticsEnum.PENALTY_OPPONENT_COLLECTED,
        CollectiveStatisticsEnum.FREE_KICK_OPPONENT_COLLECTED
      ]),
      CollectiveStatisticsCard([
        CollectiveStatisticsEnum.GAME,
        CollectiveStatisticsEnum.GAME_TIME,
        CollectiveStatisticsEnum.TIME_PER_GAME,
        CollectiveStatisticsEnum.STARTER,
        CollectiveStatisticsEnum.SUBSTITUTE
      ]),
      CollectiveStatisticsCard([
        CollectiveStatisticsEnum.YELLOW_CARD,
        CollectiveStatisticsEnum.LATE_TIME,
        CollectiveStatisticsEnum.ABSENT,
        CollectiveStatisticsEnum.REST,
        CollectiveStatisticsEnum.HURT
      ])
    ];
  }
}
