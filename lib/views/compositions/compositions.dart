import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/footer_card.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/views/compositions/composition.dart';
import 'package:my_team/views/compositions/compositions_page_view.dart';

import '../../components/view_scaffold.dart';

class Compositions extends StatelessWidget {

  final String imgBackgroundName = 'background_12.png';
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
