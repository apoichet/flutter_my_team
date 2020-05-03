import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/header.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/components/view_scaffold.dart';
import 'package:my_team/domain/player.dart';
import 'package:my_team/views/statistics/individual/individual_statistics_page_view.dart';


class IndividualStatistics extends StatelessWidget {

  final String imgBackgroundName = 'background_9.png';
  final String title = 'Fiche détaillée';
  final List<String> statMenus = ['Buts/Passes', 'Encaissés', 'Matchs', 'Flops'];

  final Player player;

  IndividualStatistics(this.player);


  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: imgBackgroundName,
      child: ViewScaffold(
        navBarSelected: NavBarEnum.STATISTICS,
        header: Header(textHeader: title),
        body: IndividualStatisticsPageView(player),
      ),
    );
  }
}
