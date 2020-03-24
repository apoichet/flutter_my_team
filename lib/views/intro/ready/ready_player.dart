import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/views/home/home.dart';
import 'package:my_team/views/intro/ready/list_item.dart';

class ReadyPlayer extends StatefulWidget {
  @override
  _ReadyPlayerState createState() => _ReadyPlayerState();
}

class _ReadyPlayerState extends State<ReadyPlayer> {

  String idPlayerSelected;

  @override
  void initState() {
    idPlayerSelected = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/img/background/background_6.png"),
              fit: BoxFit.fill)
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Column(
                children: <Widget>[
                  Text('Prêt ?', style: Theme.of(context).textTheme.caption),
                  Text('Dis nous qui tu es !', style: Theme.of(context).textTheme.title)
                ],
              )
          ),
          Expanded(
              flex: 6,
              child: _buildListPlayer(size)
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: size.width * 0.8,
              child: RaisedButton(
                disabledColor: Colors.transparent,
                onPressed: idPlayerSelected == null ? null : () {
                  setPlayerFromId(idPlayerSelected);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                color: CustomColors.RaisedButtonBackground,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                child: idPlayerSelected == null ? null : Text('C\'est parti !', style: Theme.of(context).textTheme.caption),
              ),
            ),
          )
        ],
      ),

    );
  }

  _buildListPlayer(Size size) {
    var players = getTeam().players;
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 5,
          width: size.width,
          child: Center(
            child: RotatedBox(
                quarterTurns: 1,
                child: Text('>',
                    style: Theme.of(context).textTheme.display1)
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
              color: CustomColors.IndividualCardContainer,
              borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.only(bottom: 40 ,right: 10, left: 10),
          child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (BuildContext context, int index) {
                var listItem = players[index].getId() == idPlayerSelected ?
                ListItem(player: players[index], color: CustomColors.BlackBackgroundChart) :
                ListItem(player: players[index], color: Colors.transparent);
                return GestureDetector(
                    onTap: () => _onTapPlayer(players[index]),
                    child: listItem
                );
              }
          ),
        ),
      ],

    );
  }
  _onTapPlayer(Player playerTap) {
    setState(() {
      idPlayerSelected = playerTap.getId();
    });
  }

}
