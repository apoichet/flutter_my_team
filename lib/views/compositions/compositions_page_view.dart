import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/footer_card.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/views/compositions/composition.dart';
import 'package:fc_parisii/views/results/matchs/result_match_card.dart';

class CompositionPageView extends StatefulWidget {

  final Game initialGameToShow;

  const CompositionPageView({
    Key key,
    this.initialGameToShow
  }) : super(key: key);

  @override
  _CompositionPageViewState createState() => _CompositionPageViewState();
}

class _CompositionPageViewState extends State<CompositionPageView> {

  List<Widget> _gameCompositionWidgetList;
  List<Game> _gameCompositionList;
  int _indexGame;
  PageController _controller;
  Game _game;

  @override
  void initState() {
    _gameCompositionList = getTeam().games.gameList
        .where((g) => g.gameCompositionPlayers.isNotEmpty)
        .toList()
    ;
    _game = widget.initialGameToShow == null ?
    _gameCompositionList.last :
    widget.initialGameToShow;
    _indexGame = _gameCompositionList.indexOf(_game);
    _gameCompositionWidgetList = _gameCompositionList
        .map((g) => Composition(gameComposition: g))
        .toList();
    _controller = PageController(
        initialPage: _indexGame,
        keepPage: true
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Expanded(
            flex: 8,
            child: _buildPageView(size)
        ),
        Expanded(
          child: Center(
            child: FooterCard(
              text: _buildCompoFooter(_gameCompositionList[_indexGame]),
              textSize: 16.0,
              previousCondition: _indexGame > 0,
              nextCondition: _indexGame < _gameCompositionList.length - 1,
              previousFunction: _previousCompo,
              nextFunction: _nextCompo,
              mainCallBack: () {
                Navigator.push(context,
                    buildNoAnimationRoute(ResultMatchCard(_gameCompositionList[_indexGame])));
              },
            ),
          ),
        )
      ],
    );
  }

  _buildCompoFooter(Game gameComposition) {
    String opponent = gameComposition.opponent;
    String day = gameComposition.date.day.toString().length == 1 ?
    "0" + gameComposition.date.day.toString() : gameComposition.date.day.toString();
    String month = gameComposition.date.month.toString().length == 1 ?
    "0" + gameComposition.date.month.toString() : gameComposition.date.month.toString();
    return opponent + " " + day + "/" + month;
  }

  _buildPageView(Size size) {
    return PageView(
      controller: _controller,
      children: _gameCompositionWidgetList,
      onPageChanged: (index) {
        _compoChanged(index);
      },
    );
  }

  _nextCompo() {
    if(_indexGame < _gameCompositionList.length - 1) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  _previousCompo() {
    if(_indexGame > 0) {
      _controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void _compoChanged(index) {
    setState(() {
      _indexGame = index;
    });
  }

}
