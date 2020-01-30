import 'package:barty/ui/pages/login/LoginCard/LoginCard.dart';
import 'package:barty/ui/pages/login/SignupCard/SignupCard.dart';
import 'package:barty/ui/style/style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static final routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String toDisplay = "signup";
  Widget card = LoginCard();

  switchTodisplay() {
    setState(() {
      toDisplay = toDisplay == "signup" ? "login" : "signup";
      card = toDisplay == "signup" ? LoginCard() : SignupCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 230,
                  height: 150,
                  child: Image.asset("assets/images/image.png"),
                ),
                card,
                MaterialButton(
                  onPressed: switchTodisplay,
                  child: Text(
                    toDisplay,
                    style: Theme.of(context).textTheme.body1,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
