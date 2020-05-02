import 'package:flutter/widgets.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class ShowError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveWidth(20.0),
        vertical: getResponsiveHeight(35.0)
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
                child: Image.asset(
                    "assets/img/error.gif",
                )
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: buildWidgetText(
                  text: "Oups ! Une erreur s'est produite !",
                  family: FontFamily.ARIAL,
                  weight: FontWeight.bold,
                  fontSize: getResponsiveSize(20.0)
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: buildWidgetText(
                  text: "Reviens quand tu auras du réseau ou "
                      "quand le problème sera réparé...",
                  family: FontFamily.ARIAL,
                  fontSize: getResponsiveSize(18.0)
              ),
            ),
          )
        ],
      ),
    );
  }
}
