import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          _buildText(context),
          _getLogo()
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
              'Football',
              style: Theme.of(context).textTheme.body1
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Club',
            style: Theme.of(context).textTheme.body1,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'PARISII',
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.left,
            )
        ),
      ],
    );
  }

  Widget _getLogo() {
    return Image(
      image: AssetImage('assets/img/logo.png'),
      width: 100,);



  }

}
