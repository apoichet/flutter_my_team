import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/img/background/background_1.png"),
            fit: BoxFit.fill,),),
        child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Image.asset("assets/img/logo.png")
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.85,
                  height: size.height * 0.65,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    strokeWidth: 5,
                  ),
                ),
              )
            ]
        ));
  }

}
