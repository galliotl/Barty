import 'package:barty/model/LoginOrSignup.dart';
import 'package:barty/ui/pages/login/LoginCard/LoginCard.dart';
import 'package:barty/ui/pages/login/SignupCard/SignupCard.dart';
import 'package:flutter/material.dart';

/// This class provides widgets cards and so one to the Login Page
/// And ways to change it dynamically externalising the core 
/// functions out of the widget.

class LoginOrSignupModel extends ChangeNotifier {
  LoginOrSignup _loginOrSignup = LoginOrSignup.Login;
  get loginOrSignup => _loginOrSignup;
  set loginOrSignup(LoginOrSignup loginOrSignup) {
    _loginOrSignup = loginOrSignup;
    notifyListeners();
  }

  Widget _loginOrSignupCardContent = LoginCard();
  get loginOrSignupCardContent => _loginOrSignupCardContent;
  set loginOrSignupCardContent(Widget card) {
    _loginOrSignupCardContent = card;
    notifyListeners();
  }

  String _loginOrSignupTxt = "Signup";
  get loginOrSignupTxt => _loginOrSignupTxt;
  set loginOrSignupTxt(String txt) {
    _loginOrSignupTxt = txt;
    notifyListeners();
  }

  switchCard() {
    if(loginOrSignup == LoginOrSignup.Login) {
      loginOrSignup = LoginOrSignup.Signup;
      loginOrSignupCardContent = SignupCard();
      loginOrSignupTxt = "Login";
    } else {
      loginOrSignup = LoginOrSignup.Login;
      loginOrSignupCardContent = LoginCard();
      loginOrSignupTxt = "Signup";
    }
  }

}