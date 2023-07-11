import 'package:flutter/material.dart';

class MyTheme {
  static const Color greenColor=Colors.green;
  static final lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Colors.green
    ),
      primaryColor: greenColor,
    textTheme:const TextTheme(
      headline4: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400
      ),   headline6: TextStyle(
        color: Colors.black,
        fontSize: 23,
        fontWeight: FontWeight.bold
      ),
    )
      );
}