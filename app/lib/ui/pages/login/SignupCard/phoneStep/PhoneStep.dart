import 'package:barty/model/SignupState.dart';
import 'package:barty/providerModel/SignupModel.dart';
import 'package:barty/ui/components/alert/ErrorSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PhoneStep extends StatelessWidget {
  showErrorSnackbar(BuildContext context, SignupModel model) {
    Scaffold.of(context).showSnackBar(
        ErrorSnackbar(context: context, errorMsg: model.errorMsg));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SignupModel signupModel, _) {
        if (signupModel.signupState == SignupState.PhoneInValid) {
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
                  "Phone",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    signupModel.phone = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: RaisedButton(
                  onPressed: signupModel.isPhoneFormatValid()
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
