import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_gradient.dart';
import 'package:fc_parisii/components/footer_card.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/views/statistics/collective/collective_statistics_card_result.dart';

import 'collective_statistics_result_factory.dart';

class CollectiveStatisticsCard extends StatefulWidget {
  final List<CollectiveStatisticsEnum> cards;

  CollectiveStatisticsCard(this.cards);

  @override
  _CollectiveStatisticsCardState createState() => _CollectiveStatisticsCardState();
}

class _CollectiveStatisticsCardState extends State<CollectiveStatisticsCard> {

  PageController _controller;
  List<Widget> _results;
  CollectiveStatisticsCardResult _result;
  int _indexCard;

  @override
  void initState() {
    _indexCard = 0;
    _controller = PageController(
        initialPage: _indexCard
    );
    _results = widget.cards.map((card) => buildCardResult(card)).toList();
    _result = _results[_indexCard];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(8.0),
          vertical: getResponsiveHeight(8.0)
      ),
      child: BackgroundGradient(
        colors: [
          Color.fromRGBO(152, 169, 176, 1),
          Color.fromRGBO(0, 0, 0, 0.62)
        ],
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 9,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  onPageChanged: _cardChanged,
                  controller: _controller,
                  children: _results,
                )
            ),
            Expanded(
              child: FooterCard(
                textSize: 16.0,
                text: _result.unit,
                nextFunction: _next,
                previousFunction: _previous,
                nextCondition: _indexCard < widget.cards.length - 1,
                previousCondition: _indexCard > 0,
              ),
            )
          ],
        ),
      ),
    );
  }

  _next() {
    if(_indexCard < widget.cards.length - 1) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  _previous() {
    if(_indexCard > 0) {
      _controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  _cardChanged(index) {
    setState(() {
      _indexCard = index;
      _result = buildCardResult(widget.cards[index]);
    });
  }
}
