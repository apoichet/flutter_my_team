import 'package:flutter/material.dart';

TextTheme buildTextTheme() {
  return TextTheme(

      display1: TextStyle(
          fontFamily: 'Montserrat_Alternates',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 22),

      display2: TextStyle(
          fontFamily: 'Montserrat_Alternates',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12),

      body1: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          color: Colors.white),

      body2: TextStyle(
          fontFamily: 'Arial' ,
          color: Colors.white,
          fontSize: 12
      ),

      subhead: TextStyle(
          fontFamily: 'Arial' ,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17
      ),

      headline: TextStyle(
          fontFamily: 'Arial',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20),

      title: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20),

      caption: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25),

      subtitle: TextStyle(
          fontFamily: 'Arial',
          color: Colors.white,
          fontSize: 15)
  );
}
