import 'package:url_launcher/url_launcher.dart';

final String rankingUrl = 'https://www.fff.fr/championnats/fff/ligue-de-paris-ile-de-france/2019/365904-chpt-franciliens/phase-1/poule-3/derniers-resultats';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
