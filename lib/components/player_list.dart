import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_gradient.dart';
import 'package:fc_parisii/components/player_list_item.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/theme/colors.dart';

class PlayerList extends StatefulWidget {
  final Function onTapPlayerParent;

  const PlayerList({Key key, this.onTapPlayerParent}) : super(key: key);

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List<Player> _players;
  String _idPlayerSelected;
  ScrollController _controller;
  Widget _scrollIndicator;
  Function _onTapPlayerParent;

  @override
  void initState() {
    _players = getTeam().players;
    _controller =  ScrollController();
    _controller.addListener(_endScroll);
    _scrollIndicator = Image.asset("assets/img/arrow_down.png");
    _onTapPlayerParent = widget.onTapPlayerParent ?? (Player playerTaped) => {};
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: _scrollIndicator,
          ),
        ),
        BackgroundGradient(
          colors: [
            Color.fromRGBO(165, 201, 219, 0.44),
            Color.fromRGBO(165, 201, 219, 0.10)
          ],
          child: Container(
            padding: EdgeInsets.only(bottom: 40 ,right: 10, left: 10),
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(top: 5.0),
                controller: _controller,
                itemCount: _players.length,
                itemBuilder: (BuildContext context, int index) {
                  var listItem = _players[index].getId() == _idPlayerSelected ?
                  PlayerListItem(player: _players[index], color: CustomColors.BlueSelectedPlayerItem) :
                  PlayerListItem(player: _players[index], color: Colors.transparent);
                  return GestureDetector(
                      onTap: () => _onTapPlayer(_players[index]),
                      child: listItem
                  );
                }
            ),
          ),
        ),
      ],
    );
  }
  void _onTapPlayer(Player playerTap) {
    setState(() {
      _idPlayerSelected = playerTap.getId();
      _onTapPlayerParent(playerTap);
    });
  }
  void _endScroll() {
    setState(() {
      if(_controller.offset >= _controller.position.maxScrollExtent) {
        _scrollIndicator = SizedBox.shrink();
      }
      else {
        _scrollIndicator = Image.asset("assets/img/arrow_down.png");
      }
    });
  }
}
