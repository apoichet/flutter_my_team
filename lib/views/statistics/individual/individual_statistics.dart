import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_image.dart';
import 'package:fc_parisii/components/header.dart';
import 'package:fc_parisii/components/nav_bar/nav_bar.dart';
import 'package:fc_parisii/components/view_scaffold.dart';
import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/views/statistics/individual/individual_statistics_page_view.dart';


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
