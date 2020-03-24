import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';

class ListItem extends StatelessWidget {
  final Player player;
  final Color color;
  final pathImage = 'assets/img/';
  final definitionImage = 'png';

  ListItem({this.player, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.all(3.0),
      decoration: new BoxDecoration(
          color: color,
          border: Border.all(
              width: 1.2,
              color: Colors.white
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            pathImage + player.avatar + '.' + definitionImage,
            height: 40,
            alignment: Alignment.centerLeft,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Text(player.firstName,
                  style: Theme.of(context).textTheme.headline.copyWith(fontWeight: FontWeight.normal)),
                Text(" ",
                    style: Theme.of(context).textTheme.headline.copyWith(fontWeight: FontWeight.normal)),
                Text(player.lastName,
                    style: Theme.of(context).textTheme.headline),
                Text(" - n°",
                    style: Theme.of(context).textTheme.headline.copyWith(fontWeight: FontWeight.normal)),
                Text(player.number.toString(),
                    style: Theme.of(context).textTheme.headline),
              ]
            ),
          )
        ],
      ),

    );
  }
}
