import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/compositions/arrow.dart';

import '../../components/view_scaffold.dart';
import 'composition.dart';

class Compositions extends StatefulWidget {

  final List<Game> games = getTeam().games.reversed.toList();

  @override
  _CompositionsState createState() => _CompositionsState();
}

class _CompositionsState extends State<Compositions> {
  PageController _controller = PageController(
      initialPage: 0,
      keepPage: true
  );

  int indexGame;

  @override
  void initState() {
    indexGame = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundImage(
      image: "background_12.png",
      child: ViewScaffold(
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
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0,
                            color: Colors.white
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Arrow(
                                onTap: () => _previousCompo(),
                                svg: "backward_icon.svg",
                                colorCondition: indexGame > 0
                            )
                        ),
                        Expanded(
                          flex: 8,
                          child: buildWidgetText(
                              text: _buildCompoFooter(widget.games[indexGame]),
                              family: FontFamily.ARIAL,
                              size: 17,
                              weight: FontWeight.bold
                          ),
                        ),
                        Expanded(
                            child: Arrow(
                                onTap: () => _nextCompo(),
                                svg: "forward_icon.svg",
                                colorCondition: indexGame < widget.games.length
                            )
                        ),
                      ],
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildCompoFooter(Game game) {
    String opponent = game.opponent;
    String day = game.date.day.toString().length == 1 ?
    "0" + game.date.day.toString() : game.date.day.toString();
    String month = game.date.month.toString().length == 1 ?
    "0" + game.date.month.toString() : game.date.month.toString();
    return opponent + " " + day + "/" + month + "/" + game.date.year.toString();
  }

  _buildPageView(Size size) {
    return PageView(
      controller: _controller,
      children: widget.games.map((g) => Composition(g)).toList(),
      onPageChanged: (index) {
        _compoChanged(index);
      },
    );
  }

  _nextCompo() {
    if(indexGame < widget.games.length) {
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  _previousCompo() {
    if(indexGame > 0) {
      _controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void _compoChanged(index) {
    setState(() {
      indexGame = index;
    });

  }

}
