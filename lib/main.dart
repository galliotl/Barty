import 'package:barty/ui/pages/account/AccountPage.dart';
import 'package:barty/ui/pages/account/SliderPage.dart/SliderPage.dart';
import 'package:barty/ui/pages/login/LoginPage.dart';
import 'package:barty/ui/pages/main/MainHomePage.dart';
import 'package:barty/ui/pages/splash/SplashScreen.dart';
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
      initialRoute: SplashScreen.routeName,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SplashScreen.routeName: (context) => SplashScreen(),
        MainHomePage.routeName: (context) => MainHomePage(),
        AccountPage.routeName: (context) => AccountPage(),
        SliderPage.routeName: (context) => SliderPage(),
      },
    );
  }
}
