import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_image.dart';
import 'package:fc_parisii/components/header.dart';
import 'package:fc_parisii/components/nav_bar/nav_bar.dart';
import 'package:fc_parisii/components/view_scaffold.dart';
import 'package:fc_parisii/views/statistics/collective/collective_statistics_page_view.dart';

class CollectiveStatistics extends StatelessWidget {

  final String imgBackgroundName = 'background_15.png';
  final String title = 'Fiches collectives';

  final List<String> topics;
  final int indexTopic;

  CollectiveStatistics({
    @required this.topics,
    this.indexTopic = 0
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: imgBackgroundName,
        child: ViewScaffold(
            navBarSelected: NavBarEnum.STATISTICS,
            bottomPadding: 3.0,
            header: Header(textHeader: title),
            body: CollectiveStatisticsPageView(
              indexTopic: indexTopic,
              topics: topics,
            ))
    );
  }

}
