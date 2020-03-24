import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';
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
    return BackgroundImage(
        image: "background_6.png",
        child : Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Center(child: Text('Dis nous qui tu es...',
                      style: Theme.of(context).textTheme.caption
                          .copyWith(fontFamily: 'Arial')))
              ),
              Expanded(
                  flex: 6,
                  child: _buildListPlayer(size)
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: size.width * 0.8,
                    child: Button(
                      onPressed: idPlayerSelected == null ? null : () {
                        setPlayerFromId(idPlayerSelected);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Home()));
                      },
                      text: idPlayerSelected == null ? null : "Je suis prêt",
                    )
                ),
              )
            ],
          ),

        )


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
            child: Image.asset("assets/img/arrow_down.png")
          ),
        ),
        Container(
          decoration: new BoxDecoration(
              color: CustomColors.IndividualCardContainerGradientMiddle,
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
