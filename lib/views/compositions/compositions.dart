import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/footer_card.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/views/compositions/composition.dart';

import '../../components/view_scaffold.dart';

class Compositions extends StatefulWidget {

  final Game initialGameToShow;

  const Compositions({
    Key key,
    this.initialGameToShow
  }) : super(key: key);

  @override
  _CompositionsState createState() => _CompositionsState();
}

class _CompositionsState extends State<Compositions> {

  List<Widget> _gameCompositionWidgetList;
  List<Game> _gameCompositionList;
  int _indexGame;
  PageController _controller;

  @override
  void initState() {
    _gameCompositionList = getTeam().games
        .where((g) => g.gameCompositionPlayers.isNotEmpty)
        .toList()
    ;
    Game game = widget.initialGameToShow == null ?
    _gameCompositionList.last :
    widget.initialGameToShow;
    _indexGame = _gameCompositionList.indexOf(game);
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundImage(
      image: "background_12.png",
      child: ViewScaffold(
        navBarSelected: NavBarEnum.COMPOSITIONS,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Header(textHeader: "Compositions",
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.45))
            ),
            Expanded(
                flex: 8,
                child: _buildPageView(size)
            ),
            Expanded(
              child: Center(
                child: FooterCard(
                  text: _buildCompoFooter(_gameCompositionList[_indexGame]),
                  textSize: 18.0,
                  previousCondition: _indexGame > 0,
                  nextCondition: _indexGame < _gameCompositionList.length - 1,
                  previousFunction: _previousCompo,
                  nextFunction: _nextCompo,
                ),
              ),
            )
          ],
        ),
      ),
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
