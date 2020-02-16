import 'package:barty/db/UserRepository.dart';
import 'package:barty/model/AuthenticationState.dart';
import 'package:barty/model/LoginState.dart';
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
    LoginContext loginContext = await userRepository?.loginUser(phone, password);
    if(loginContext.state == LoginState.LoginSucceded) {
      state = AuthenticationState.Authenticated;
    } else {
      state = AuthenticationState.UnAuthenticated;
      error = loginContext.msg;
    }
  }

  signupUser(String phone, String psw, String firstname, String lastname, String signupToken) {
    // Todo: signup the user
    state = AuthenticationState.Authenticated;
  }

  signout() {
    userRepository?.deleteToken();
    state = AuthenticationState.UnAuthenticated;
  }
}
