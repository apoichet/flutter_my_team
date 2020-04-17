import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/circle.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/view_scaffold.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class CollectiveStatistics extends StatefulWidget {

  final List<String> topics;
  final int indexStat;

  CollectiveStatistics({
    @required this.topics,
    this.indexStat = 0
  });

  @override
  _CollectiveStatisticsState createState() => _CollectiveStatisticsState();
}

class _CollectiveStatisticsState extends State<CollectiveStatistics> {
  int _indexPrevious;
  int _indexNext;
  int _index;
  PageController _controller;

  @override
  void initState() {
    _controller = new PageController(
      initialPage: widget.indexStat,
    );
    _index = widget.indexStat;
    _indexPrevious = _index - 1;
    _indexNext = _index + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: "background_15.png",
      child: ViewScaffold(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Header(
                    textHeader: "Statistiques collectives"
                )
            ),
            Expanded(
                flex: 9,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: _buildTopics()
                    ),
                    Expanded(
                        flex: 7,
                        child: _buildPageView()
                    ),
                    Expanded(
                        child: _buildFooter()
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopics() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getResponsiveHeight(20.0)
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent
          //color: Color.fromRGBO(196, 196, 196, 0.5)
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _indexPrevious >= 0 ? GestureDetector(
                onTap: () => _onPageChanged(_index - 1),
                child: buildWidgetText(
                    text: widget.topics[_indexPrevious],
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: getResponsiveHeight(16.0),
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
                    fontSize: getResponsiveHeight(22.0)
                )
            ),
            Expanded(
              flex: 2,
              child: _indexNext < widget.topics.length ? GestureDetector(
                onTap: () => _onPageChanged(_index + 1),
                child: buildWidgetText(
                    text: widget.topics[_indexNext],
                    family: FontFamily.ARIAL,
                    weight: FontWeight.bold,
                    fontSize: getResponsiveHeight(16.0),
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
      controller: _controller,
      onPageChanged: (index) {_onPageChanged(index);},
      children: widget.topics.map((topic) => Text(topic)).toList(),
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
          )
      ).toList(),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _index = index;
      _controller.jumpToPage(_index);
      _indexNext = _index + 1;
      _indexPrevious = _index - 1;
    });
  }

}
