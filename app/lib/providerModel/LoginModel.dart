import 'package:flutter/foundation.dart';

class LoginModel extends ChangeNotifier {
  String _errorMsg = "";
  get errorMsg => _errorMsg;
  set errorMsg(String msg) {
    _errorMsg = msg;
    notifyListeners();
  }

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
    // need to call the Users/signup/phone api to get the token n shit
    return true;
  }
}
