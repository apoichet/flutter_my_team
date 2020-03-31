import 'package:flutter/widgets.dart';
import 'package:my_team/components/background_image.dart';
import 'package:my_team/components/header.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: "background_14.png",
      child: Column(
        children: <Widget>[
          Expanded(
              child: Header(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.45),
                  textHeader: "Résultats"
              )
          ),
          Expanded(
              flex: 2,
              child: Text("")
          ),
          Expanded(
              flex: 7,
              child: Text("")
          ),
        ],
      ),
    );
  }
}
