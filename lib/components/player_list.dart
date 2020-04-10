import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_gradient.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/components/player_list_item.dart';

class PlayerList extends StatefulWidget {
  final onTapPlayerParent;

  const PlayerList({Key key, this.onTapPlayerParent}) : super(key: key);

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List<Player> players;
  String idPlayerSelected;

  @override
  void initState() {
    players = getTeam().players;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset("assets/img/arrow_down.png"),
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
                itemCount: players.length,
                itemBuilder: (BuildContext context, int index) {
                  var listItem = players[index].getId() == idPlayerSelected ?
                  PlayerListItem(player: players[index], color: CustomColors.BlueSelectedPlayerItem) :
                  PlayerListItem(player: players[index], color: Colors.transparent);
                  return GestureDetector(
                      onTap: () => _onTapPlayer(players[index]),
                      child: listItem
                  );
                }
            ),
          ),
        ),
      ],
    );
  }
  _onTapPlayer(Player playerTap) {
    setState(() {
      idPlayerSelected = playerTap.getId();
      if(widget.onTapPlayerParent != null) {
        widget.onTapPlayerParent(playerTap);
      }
    });
  }
}
