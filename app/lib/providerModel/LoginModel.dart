import 'package:flutter/foundation.dart';

/// This provider model is only used to store the login variable.
/// This way we can verify independently from the view if a login
/// is valid. 
class LoginModel extends ChangeNotifier {
  String _phone = "";
  get phone => _phone;
  set phone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  String _password = "";
  get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  bool isLoginValid() {
    bool valid = password.length > 0 && phone.length >= 10;
    return valid;
  }
  
  bool verifyPhone(String phone) {
    if (phone.length <= 10) return false;
    return true;
  }
}
