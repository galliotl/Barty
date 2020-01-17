import 'package:barty/ui/pages/main/MainHomePage.dart';
import 'package:flutter/material.dart';
import 'package:barty/ui/style/style.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  
  var _phone = "";
  var _password = "";

  void login() {
    Navigator.of(context).pushNamed(MainHomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _phone = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 45),
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
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
    );
  }
}
