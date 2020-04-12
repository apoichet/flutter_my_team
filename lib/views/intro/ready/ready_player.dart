import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/components/view_padding.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/home/home.dart';

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
                flex: 2,
                child: Center(
                    child: buildWidgetText(
                        fontSize: getResponsiveWidth(28.0),
                        text: widget.readyTitleText,
                        family: FontFamily.ARIAL,
                        weight: FontWeight.bold
                    )),
              ),
              Expanded(
                  flex: 6,
                  child: PlayerList(onTapPlayerParent: _onTapPlayer)
              ),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.center,
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
