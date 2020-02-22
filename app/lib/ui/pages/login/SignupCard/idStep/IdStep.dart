import 'package:barty/providerModel/AuthModel.dart';
import 'package:barty/providerModel/SignupModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IDStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SignupModel signupModel, _) {
        return Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  "Identity",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              TextField(
                onChanged: (value) {
                  signupModel.firstname = value;
                },
                decoration: InputDecoration(
                  labelText: 'First name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  signupModel.firstname = value;
                },
                decoration: InputDecoration(
                  labelText: 'Last name',
                ),
              ),
              CheckboxListTile(
                title: const Text('I am over 18 y.o.'),
                value: signupModel.major,
                onChanged: (bool value) {
                  signupModel.major = value;
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Consumer(
                  builder: (context, AuthModel authModel, _) {
                    return RaisedButton(
                      onPressed: signupModel.isFormFormatValid()
                          ? () {
                              authModel.signupUser(
                                signupToken: signupModel.signupToken,
                                firstname: signupModel.firstname,
                                lastname: signupModel.lastname,
                                psw: signupModel.password,
                                isMajor: signupModel.major,
                                isPhoneConfirmed: signupModel.verifyPhoneCode()
                              );
                            }
                          : null,
                      child: Text(
                        "Signup",
                        style: Theme.of(context).textTheme.body1,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
