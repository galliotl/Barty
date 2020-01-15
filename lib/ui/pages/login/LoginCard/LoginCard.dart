import 'package:barty/ui/pages/main/MainHomePage.dart';
import 'package:flutter/material.dart';
import 'package:barty/ui/style/style.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  
  void login() {
    Navigator.of(context).pushNamed(MainHomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      widthFactor: .9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: deepBlack.withOpacity(.16),
            )
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 15, 30, 45),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: RaisedButton(
                  onPressed: login,
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
