import 'package:barty/model/SignupState.dart';
import 'package:barty/providerModel/SignupModel.dart';
import 'package:barty/ui/components/alert/ErrorSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PswStep extends StatelessWidget {
 showErrorSnackbar(BuildContext context, SignupModel model) {
    Scaffold.of(context).showSnackBar(
        ErrorSnackbar(context: context, errorMsg: model.errorMsg));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SignupModel signupModel, _) {
        if (signupModel.signupState == SignupState.PswInvalid) {
          showErrorSnackbar(context, signupModel);
        }
        return Stack(
          children: [
            // Titre
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  "Password",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    signupModel.password = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: RaisedButton(
                  onPressed: signupModel.verifyPsw()
                      ? () {
                          signupModel.nextStep();
                        }
                      : null,
                  child: Text(
                    "Next",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
