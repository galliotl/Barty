import 'package:flutter/material.dart';
import 'package:barty/ui/style/style.dart';

class SignupCard extends StatefulWidget {
  @override
  _SignupCardState createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  void signup() {}

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
              onPressed: signup,
              child: Text(
                "Signup",
                style: Theme.of(context).textTheme.body1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
