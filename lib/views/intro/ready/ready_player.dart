import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/components/view_padding.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/home/home.dart';
import 'package:my_team/components/view_scaffold.dart';

class ReadyPlayer extends StatefulWidget {
  final String readyTitleText = "Dis nous qui tu es...";
  final String readyBottomText = "Je suis prêt";
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
        child : ViewPadding(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                    child: buildWidgetText(
                        text: widget.readyTitleText,
                        family: FontFamily.ARIAL,
                        size: 25,
                        weight: FontWeight.bold
                    )),
              ),
              Expanded(
                  flex: 6,
                  child: PlayerList(onTapPlayerParent: _onTapPlayer)
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: size.width * 0.8,
                    child: Button(
                      onPressed: idPlayerSelected == null ? null : () {
                        setPlayerFromId(idPlayerSelected);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Home()
                        ));
                      },
                      text: idPlayerSelected == null ? null : widget.readyBottomText,
                    )
                ),
              )
            ],
          ),
        )
    );
  }
  _onTapPlayer(Player playerTap) {
    setState(() {
      idPlayerSelected = playerTap.getId();
    });
  }
}
