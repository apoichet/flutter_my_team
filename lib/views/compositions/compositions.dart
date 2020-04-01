import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/header.dart';

import '../../components/view_scaffold.dart';

class Compositions extends StatefulWidget {
  @override
  _CompositionsState createState() => _CompositionsState();
}

class _CompositionsState extends State<Compositions> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: "background_12.png",
      child: ViewScaffold(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Header(textHeader: "Compositions",
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.45))
            ),
            Expanded(
              flex: 8,
                child: Text("")
            ),
            Expanded(
                child: Text("")
            )
          ],
        ),
      ),
    );
  }
}
