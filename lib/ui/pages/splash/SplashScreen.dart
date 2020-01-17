import 'package:barty/ui/pages/login/LoginPage.dart';
import 'package:barty/ui/pages/main/MainHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    redirectUser();
  }

  Future<void> redirectUser() async {
    storage.read(key: "uuid").then((uuid) {
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
