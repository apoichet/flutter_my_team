import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _buildCircularProgressIndicator()
    );
  }

  Widget _buildCircularProgressIndicator() {
    return Platform.isIOS ?
    CupertinoActivityIndicator(
      animating: true,
      radius: 20.0,
    ) :
    CircularProgressIndicator(
      backgroundColor: Colors.transparent,
    );
  }
}
