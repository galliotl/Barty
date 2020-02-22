import 'package:barty/model/SignupState.dart';
import 'package:barty/providerModel/SignupModel.dart';
import 'package:barty/ui/pages/login/LoadingCard.dart';
import 'package:barty/ui/pages/login/SignupCard/idStep/IdStep.dart';
import 'package:barty/ui/pages/login/SignupCard/phoneConfirmationStep/PhoneConfirmationStep.dart';
import 'package:barty/ui/pages/login/SignupCard/phoneStep/PhoneStep.dart';
import 'package:barty/ui/pages/login/SignupCard/pswStep/PswStep.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupModel(),
      child: Consumer(
        builder: (context, SignupModel signupModel, _) {
          switch (signupModel.signupState) {
            case SignupState.PhoneCodeEntered:
            case SignupState.IdEntered:
            case SignupState.PhoneEntered:
            case SignupState.IdEntered:
              return LoadingCard();

            case SignupState.PhoneInValid:
            case SignupState.Empty:
              {
                return PhoneStep();
              }
            case SignupState.PhoneCodeInvalid:
            case SignupState.PhoneValidated:
              {
                return PhoneConfirmationStep();
              }
            case SignupState.PswInvalid:
            case SignupState.PhoneCodeConfirmed:
              {
                return PswStep();
              }
            case SignupState.PswValid:
              {
                return IDStep();
              }
            case SignupState.SignedUp:
              {
                return Placeholder();
              }
          }
          return LoadingCard();
        },
      ),
    );
  }
}
