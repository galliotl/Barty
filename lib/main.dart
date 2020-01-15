import 'package:barty/ui/pages/account/AccountPage.dart';
import 'package:barty/ui/pages/account/QRCodePage.dart/QRCodePage.dart';
import 'package:barty/ui/pages/main/MainHomePage.dart';
import 'package:barty/ui/style/style.dart';
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
      initialRoute: MainHomePage.routeName,
      routes: {
        MainHomePage.routeName: (context) => MainHomePage(),
        AccountPage.routeName: (context) => AccountPage(),
        QRCodePage.routeName: (context) => QRCodePage(),
      },
    );
  }
}
