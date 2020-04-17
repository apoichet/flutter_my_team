import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/footer_card.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/view_scaffold.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/views/statistics/individual/individual_statistics_card.dart';

class IndividualStatistics extends StatefulWidget {
  final int indexPlayer;
  final List<String> statMenus;

  IndividualStatistics({
    this.statMenus,
    this.indexPlayer = 0
  });

  @override
  _IndividualStatisticsState createState() => _IndividualStatisticsState();
}

class _IndividualStatisticsState extends State<IndividualStatistics> {

  PageController _controller;
  int _indexPlayer;

  @override
  void initState() {
    _controller = PageController(
        initialPage: widget.indexPlayer,
        keepPage: true
    );
    _indexPlayer = widget.indexPlayer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: "background_9.png",
      child: ViewScaffold(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Header(
                    textHeader: "Fiche détaillée"
                )
            ),
            Expanded(
                flex: 9,
                child: Padding(
                  padding: EdgeInsets.only(top: getResponsiveHeight(25.0)),
                  child: BackgroundGradient(
                    colors: [
                      Color.fromRGBO(134, 134, 134, 0.9),
                      Color.fromRGBO(255, 255, 255, 0)
                    ],
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 9,
                          child: PageView(
                            controller: _controller,
                            children: getTeam().players
                                .map((p) => IndividualStatisticsCard(
                              titleTopics: widget.statMenus,
                              playerSelected: p,
                            )).toList(),
                            onPageChanged: (index) {
                              _playerChanged(index);
                            },
                          ),
                        ),
                        Expanded(
                            child: FooterCard(
                              text: _buildPlayerNameFooter(),
                              textSize: 22.0,
                              previousFunction: _previousPlayer,
                              nextFunction: _nextPlayer,
                              previousCondition: _indexPlayer > 0,
                              nextCondition: _indexPlayer < getTeam().players.length - 1,
                            )
                        )
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  _buildPlayerNameFooter() {
    Player playerSelected = getTeam().players[_indexPlayer];
    return playerSelected.firstName + " " + playerSelected.lastName;
  }

  _nextPlayer() {
    if(_indexPlayer < getTeam().players.length - 1) {
      _controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  _previousPlayer() {
    if(_indexPlayer > 0) {
      _controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void _playerChanged(index) {
    setState(() {
      _indexPlayer = index;
    });
  }
}
