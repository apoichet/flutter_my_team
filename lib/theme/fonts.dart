import 'package:flutter/material.dart';

TextTheme buildTextTheme() {
  return TextTheme(
      display1: TextStyle(
          fontFamily: 'Arial',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30),

      body1: TextStyle(
          fontFamily: 'Arial' ,
          color: Colors.white),

      body2: TextStyle(
          fontFamily: 'Arial' ,
          color: Colors.white,
          fontSize: 12
      ),

      headline: TextStyle(
          fontFamily: 'Arial',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17),

      title: TextStyle(
          fontFamily: 'Arial',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20),

      caption: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 23),

      subtitle: TextStyle(
          fontFamily: 'Arial',
          color: Colors.white,
          fontSize: 15)
  );
}
