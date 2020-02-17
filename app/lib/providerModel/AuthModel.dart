import 'package:barty/db/UserRepository.dart';
import 'package:barty/model/AuthenticationState.dart';
import 'package:barty/model/LoginState.dart';
import 'package:barty/model/SignupState.dart';
import 'package:flutter/foundation.dart';

class AuthModel extends ChangeNotifier {
  AuthenticationState _state = AuthenticationState.Unchecked;
  get state => _state;
  set state(AuthenticationState state) {
    _state = state;
    notifyListeners();
  }

  String _error;
  get error => _error;
  set error(String error) {
    _error = error;
    notifyListeners();
  }

  UserRepository userRepository = UserRepository();

  AuthModel() {
    userRepository.hasToken().then((isAuthed) {
      if (isAuthed) {
        state = AuthenticationState.Authenticated;
      } else {
        state = AuthenticationState.UnAuthenticated;
      }
    });
  }

  Future<void> login(String phone, String password) async {
    LoginContext loginContext =
        await userRepository?.loginUser(phone, password);
    if (loginContext.state == LoginState.LoginSucceded) {
      state = AuthenticationState.Authenticated;
    } else {
      state = AuthenticationState.UnAuthenticated;
      error = loginContext.msg;
    }
  }

  signupUser(
      {@required String psw,
      @required String firstname,
      @required String lastname,
      @required String signupToken,
      @required bool isMajor,
      @required bool isPhoneConfirmed}) async {
    SignupContext loginContext = await userRepository?.signupUser(
        signupToken: signupToken,
        name: "$firstname $lastname",
        password: psw,
        isMajor: isMajor,
        isPhoneConfirmed: isPhoneConfirmed);
    if (loginContext.state == SignupState.SignedUp) {
      state = AuthenticationState.Authenticated;
    } else {
      state = AuthenticationState.UnAuthenticated;
      error = loginContext.msg;
    }
  }

  signout() {
    userRepository?.deleteToken();
    state = AuthenticationState.UnAuthenticated;
  }
}
