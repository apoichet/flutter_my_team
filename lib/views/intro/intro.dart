import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/circle.dart';

import 'boarding/boardings_builder.dart';
import 'ready/ready_player.dart';

class _IntroState extends State<Intro> {
  var circles;
  var boardingBackground;
  var indexBoarding;
  PageController _controller = PageController(
      initialPage: 0,
      keepPage: true
  );
  @override
  void initState() {
    boardingBackground = widget.boardings[0].backgroundPath.toString();
    circles = _buildCircles();
    indexBoarding = 0;
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
    var image = 'background_4';
    return Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/img/background/" + boardingBackground + ".png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: size.height * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: PageView(
              children: widget.boardings,
              controller: _controller,
              onPageChanged: (index) {
                _pageChanged(index);
              },
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        onTap: () =>  _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
                        child: Text(indexBoarding == 0 ? '' : widget.previous, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline)
                    )
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: circles,
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () => nextPage(context),
                        child: Text(widget.next, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline)
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void nextPage(context) {
    if(indexBoarding == widget.boardings.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ReadyPlayer()));
    }
    else {
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void _pageChanged(index) {
    setState(() {
      circles = _buildCircles(indexFull: index);
      boardingBackground = widget.boardings[index].backgroundPath.toString();
      indexBoarding = index;
    });
  }
  List<Circle> _buildCircles({int indexFull = 0}) {
    var circles = <Circle>[];
    for (int i = 0; i < widget.boardings.length; i++) {
      circles.add(Circle(full: i == indexFull));
    }
    return circles;
  }
}

class Intro extends StatefulWidget {
  final boardings = buildBoardings();
  final previous = 'PREV';
  final next = 'NEXT';
  @override
  State<StatefulWidget> createState() => _IntroState();
}





