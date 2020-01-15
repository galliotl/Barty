import 'package:barty/ui/pages/login/LoginPage.dart';
import 'package:barty/ui/pages/main/MainHomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  static final routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    isUserConnected();
  }

  Future<void> isUserConnected() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((pref) {
      String uuid = pref.getString('uuid');
      if (uuid == null || uuid.isEmpty) {
        Navigator.pushNamed(context, LoginPage.routeName);
      } else {
        Navigator.pushNamed(context, MainHomePage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 230,
          height: 150,
          child: Image.asset("assets/images/image.png"),
        ),
      ),
    );
  }
}
