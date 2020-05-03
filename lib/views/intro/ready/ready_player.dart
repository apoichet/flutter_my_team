import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/button.dart';
import 'package:my_team/components/player_list.dart';
import 'package:my_team/components/view_padding.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/text_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/home/home.dart';

class ReadyPlayer extends StatefulWidget {
  final String imgBackgroundName = 'background_6.png';
  final String readyTitleText = 'Dis nous qui tu es...';
  final String readyBottomText = 'Je suis prêt';
  @override
  _ReadyPlayerState createState() => _ReadyPlayerState();
}

class _ReadyPlayerState extends State<ReadyPlayer> {

  String _idPlayerSelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: widget.imgBackgroundName,
        child : ViewPadding(
          bottomPadding: 15.0,
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
                      onPressed: isNullOrEmpty(_idPlayerSelected) ? null :
                          () => _onPressedReadyButton(context),
                      text: isNullOrEmpty(_idPlayerSelected) ? null :
                      widget.readyBottomText,
                    )
                ),
              )
            ],
          ),
        )
    );
  }

  void _onPressedReadyButton(BuildContext context) {
    setPlayerFromId(_idPlayerSelected);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()
    ));
  }

  void _onTapPlayer(Player playerTap) {
    setState(() {
      _idPlayerSelected = playerTap.getId();
    });
  }
}
