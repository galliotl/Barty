import 'package:barty/pages/main/MainHomePage.dart';
import 'package:barty/style/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barty',
      theme: lightTheme,
      home: MainHomePage(),
    );
  }
}