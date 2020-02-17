import 'package:barty/providerModel/SignupModel.dart';
import 'package:barty/ui/components/alert/ErrorSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PhoneConfirmationStep extends StatelessWidget {
  showErrorSnackbar(BuildContext context, SignupModel model) {
    Scaffold.of(context).showSnackBar(
        ErrorSnackbar(context: context, errorMsg: model.errorMsg));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, SignupModel signupModel, _) {
        return Stack(
          children: [
            // Titre
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: [
                    Text(
                      "Phone confirmation",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "You will receive a sms with an activation code. Please write it down here",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ],
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
                    signupModel.phoneCode = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Code',
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: RaisedButton(
                  onPressed: signupModel.isPhoneCodeFormatValid()
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
