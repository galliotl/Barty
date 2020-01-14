import 'package:flutter/material.dart';

const Color lightBlue = Color.fromRGBO(69, 160, 157, 1);
const Color deepBlue = Color.fromRGBO(72, 104, 152, 1);
const Color deepBlack = Color.fromRGBO(34, 34, 34, 1);
const Color lightBlack = Color.fromRGBO(85, 85, 85, 1);
const Color green = Color.fromRGBO(90, 172, 66, 1);
const Color lightGrey = Color.fromRGBO(236, 236, 236, 1);
const Color white = Colors.white;

LinearGradient gradient = LinearGradient(
  // Where the linear gradient begins and ends
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  // Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.1, 0.9],
  colors: [deepBlue, lightBlue],
);

ThemeData commonBetweenLightAndDark = ThemeData(
  primaryColor: deepBlue,
  accentColor: green,
  iconTheme: IconThemeData(color: white),
  bottomAppBarTheme: BottomAppBarTheme(
    elevation: 0,
  ),
  textTheme: TextTheme(
    body1: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 17,
      color: white,
      fontWeight: FontWeight.w600
    ),
    body2: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 15,
    ),
    subtitle: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    title: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
  ),
);

ThemeData darkTheme = commonBetweenLightAndDark.copyWith(
    canvasColor: deepBlack,
    scaffoldBackgroundColor: deepBlack,
    bottomAppBarColor: deepBlack,
    textTheme: TextTheme(
      body1: TextStyle(
        color: lightBlack,
      ),
      body2: TextStyle(
        color: Colors.white,
      ),
      subtitle: TextStyle(color: lightBlue),
      title: TextStyle(color: Colors.white),
    ));

ThemeData lightTheme = commonBetweenLightAndDark.copyWith(
    canvasColor: white,
    bottomAppBarColor: white,
    scaffoldBackgroundColor: white);
