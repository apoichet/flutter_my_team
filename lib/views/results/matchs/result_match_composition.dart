import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/compositions/compositions.dart';
import 'package:fc_parisii/views/compositions/compositions_page_view.dart';

class ResultMatchComposition extends StatelessWidget {

  final Game game;

  ResultMatchComposition(this.game);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(50.0),
          vertical: getResponsiveHeight(15.0)
      ),
      child: _buildCompositionBlock(context)
    );
  }

  _buildCompositionBlock(BuildContext ctx) {
    return Stack(
        alignment: Alignment.center,
        children: <Widget> [
          RotatedBox(
            quarterTurns: 1,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Image.asset(
                  "assets/img/composition.png",
                ),
              ),
            ),
          ),
          _buildCompositionTextContainer(
              core: game.gameCompositionPlayers.isEmpty ?
              _buildWithoutCompositionLink() :
              _buildWithCompositionLink(ctx),
          )
        ]
    );
  }

  _buildCompositionTextContainer({Widget core}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getResponsiveWidth(15.0),
          vertical: getResponsiveHeight(5.0)
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(119, 135, 155, 1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.white,
              width: 2.0
          )
      ),
      child: core,
    );
  }

  _buildWithCompositionLink(BuildContext ctx) {
    return GestureDetector(
        onTap: () {
          Navigator.push(ctx,
              buildNoAnimationRoute(Compositions(initialGameToShow: game))
          );
        },
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 9,
                child: _buildText("Voir la composition")
            ),
            Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  "assets/icon/detail_icon.svg",
                  height: getResponsiveHeight(30.0),
                  width: getResponsiveWidth(30.0),
                )
            ),
          ],
        ));
  }

  _buildWithoutCompositionLink() {
    return _buildText("Composition à venir");
  }

  _buildText(String text) {
    return buildWidgetText(
        text: text,
        color: Colors.white,
        family: FontFamily.ARIAL,
        fontSize: getResponsiveSize(20.0)
    );
  }

}
