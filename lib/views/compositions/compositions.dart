import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_image.dart';
import 'package:fc_parisii/components/footer_card.dart';
import 'package:fc_parisii/components/header.dart';
import 'package:fc_parisii/components/nav_bar/nav_bar.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/views/compositions/composition.dart';
import 'package:fc_parisii/views/compositions/compositions_page_view.dart';

import '../../components/view_scaffold.dart';

class Compositions extends StatelessWidget {

  final String imgBackgroundName = 'background_10.png';
  final String title = 'Compositions';

  final Game initialGameToShow;

  const Compositions({Key key, this.initialGameToShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: imgBackgroundName,
      child: ViewScaffold(
          navBarSelected: NavBarEnum.COMPOSITIONS,
          header: Header(textHeader: title,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.45)
          ),
          body: CompositionPageView(
            initialGameToShow: initialGameToShow,
          )),
    );
  }
}
