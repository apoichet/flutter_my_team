import 'package:flutter/widgets.dart';
import 'package:my_team/components/header.dart';

class Compositions extends StatefulWidget {
  @override
  _CompositionsState createState() => _CompositionsState();
}

class _CompositionsState extends State<Compositions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Header(textHeader: "Compositions")
        ),
        Expanded(
          flex: 8,
            child: Text("")
        ),
        Expanded(
            child: Text("")
        )
      ],
    );
  }
}
