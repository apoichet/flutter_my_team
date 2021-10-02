import 'package:fc_parisii/components/background_gradient.dart';
import 'package:fc_parisii/components/footer_card.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/views/statistics/individual/individual_statistics_card.dart';
import 'package:flutter/widgets.dart';

class IndividualStatisticsPageView extends StatefulWidget {

  final List<String> statMenus = ['Buts/Passes', 'Encaissés', 'Matchs', 'Flops'];

  final Player player;

  IndividualStatisticsPageView(this.player);

  @override
  _IndividualStatisticsPageViewState createState() => _IndividualStatisticsPageViewState();
}

class _IndividualStatisticsPageViewState extends State<IndividualStatisticsPageView> {

  PageController _controller;
  int _indexPlayer;

  @override
  void initState() {
    _indexPlayer = getTeam().players.indexOf(widget.player);
    _controller = PageController(
        initialPage: _indexPlayer,
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
    return Padding(
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
                physics: ClampingScrollPhysics(),
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
                  textSize: 20.0,
                  previousFunction: _previousPlayer,
                  nextFunction: _nextPlayer,
                  previousCondition: _indexPlayer > 0,
                  nextCondition: _indexPlayer < getTeam().players.length - 1,
                )
            )
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
