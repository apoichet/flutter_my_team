import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/components/circle.dart';

import 'boarding/boarding.dart';
import 'boarding/boardings_builder.dart';
import 'ready/ready_player.dart';

class Intro extends StatefulWidget {
  final List<Boarding> boardings = buildBoardings();
  final String previous = 'PREV';
  final String next = 'NEXT';

  @override
  State<StatefulWidget> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Widget> _circles;
  String _boardingBackgroundName;
  int _boardingIndex;
  PageController _pageController;
  @override
  void initState() {
    _boardingBackgroundName = widget.boardings[0].backgroundPath.toString();
    _circles = _buildCircles();
    _boardingIndex = 0;
    _pageController = PageController(
        initialPage: _boardingIndex,
        keepPage: true
    );
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/img/background/" + _boardingBackgroundName + ".png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: PageView(
                children: widget.boardings,
                controller: _pageController,
                onPageChanged: (index) {
                  _pageChanged(index);
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        onTap: () =>  _previousPage(),
                        child: buildWidgetText(
                            text: _boardingIndex == 0 ? '' : widget.previous,
                            family: FontFamily.ARIAL,
                            weight: FontWeight.bold,
                            fontSize: getResponsiveWidth(18.0)
                        )
                    )
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _circles,
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () => _nextPage(context),
                        child: buildWidgetText(
                            text: widget.next,
                            family: FontFamily.ARIAL,
                            weight: FontWeight.bold,
                            fontSize: getResponsiveWidth(18.0)
                        )
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _previousPage() {
    _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void _nextPage(context) {
    if(_boardingIndex == widget.boardings.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ReadyPlayer()));
    }
    else {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void _pageChanged(index) {
    setState(() {
      _circles = _buildCircles(indexFull: index);
      _boardingBackgroundName = widget.boardings[index].backgroundPath.toString();
      _boardingIndex = index;
    });
  }

  List<Widget> _buildCircles({int indexFull = 0}) {
    var circles = <Circle>[];
    for (int i = 0; i < widget.boardings.length; i++) {
      circles.add(Circle(full: i == indexFull, colorFull: Colors.green, colorEmpty: Colors.white));
    }
    return circles;
  }
}





