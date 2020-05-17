import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class IndividualStatisticsHeaderCard extends StatelessWidget {
  final Player player;

  IndividualStatisticsHeaderCard(this.player);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: "Nom : ",
                      color: Colors.white,
                      fontSize: 16.0,
                      weight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      family: FontFamily.ARIAL
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Center(
                  child: buildWidgetText(
                      text: player.nickName,
                      color: Colors.white,
                      fontSize: 22.0,
                      weight: FontWeight.bold,
                      family: FontFamily.ARIAL
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: "Poste : ",
                      color: Colors.white,
                      fontSize: 16.0,
                      weight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      family: FontFamily.ARIAL
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getResponsiveHeight(5.0)
                    ),
                    child: buildWidgetText(
                        text: player.position,
                        color: Colors.white,
                        fontSize: 22.0,
                        weight: FontWeight.bold,
                        family: FontFamily.ARIAL
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: buildWidgetText(
                      text: "Num : ",
                      color: Colors.white,
                      fontSize: 16.0,
                      weight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      family: FontFamily.ARIAL
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Center(
                  child: buildWidgetText(
                      text: player.number.toString(),
                      color: Colors.white,
                      fontSize: 25.0,
                      weight: FontWeight.bold,
                      family: FontFamily.ARIAL
                  ),
                ),
              )
            ],

          ),
        ),

      ],


    );





    /*return Column(
      children: <Widget>[
        Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: _buildText(
                      text: player.nickName,
                      textSize: 22,
                      align: Alignment.bottomCenter
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: _buildText(
                      text: "n°" + player.number.toString(),
                      textSize: 22,
                      align: Alignment.bottomCenter
                  ),
                )
              ],
            )
        ),
        Expanded(
          child: _buildText(
              text: player.position,
              textSize: 18,
              align: Alignment.center
          ),
        )
        *//*Expanded(
            child: _buildRow(
              first: "Nom :",
              sizeFirst: 14.0,
              second: player.nickName,
              sizeSecond: 24.0,
              alignment: Alignment.center
            )
        ),
        Expanded(
            child: _buildRow(
                first: "Poste :",
                sizeFirst: 14.0,
                second: player.position,
                sizeSecond: 18.0,
                alignment: Alignment.center
            )
        ),
        Expanded(
            child: _buildRow(
                first: "N° :",
                sizeFirst: 14.0,
                second: player.number.toString(),
                sizeSecond: 28.0,
                alignment: Alignment.center
            )
        ),*//*

      ],
    );*/
  }

  Widget _buildText({String text, double textSize, Alignment align}) {
    return Align(
      alignment: align,
      child: buildWidgetText(
          text: text,
          fontSize: getResponsiveHeight(textSize),
          family: FontFamily.ARIAL,
          weight: FontWeight.bold,
          color: Colors.white
      ),
    );
  }

  _buildRow({String first, double sizeFirst, String second, double sizeSecond, Alignment alignment}) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: buildWidgetText(
              align: TextAlign.left,
              text: first,
              fontSize: getResponsiveHeight(sizeFirst),
              family: FontFamily.ARIAL,
              fontStyle: FontStyle.italic,
              color: Colors.white.withOpacity(0.8)
          ),
        ),
        Expanded(
          flex: 7,
          child: Align(
            alignment: alignment,
            child: buildWidgetText(
                text: second,
                fontSize: getResponsiveHeight(sizeSecond),
                family: FontFamily.ARIAL,
                weight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),

      ],
    );
  }

}
