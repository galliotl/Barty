import 'package:barty/model/SignupState.dart';
import 'package:flutter/foundation.dart';

class SignupModel extends ChangeNotifier {
  
  String _errorMsg = "";
  get errorMsg => _errorMsg;
  set errorMsg(String msg) {
    _errorMsg = msg;
    notifyListeners();
  }

  String signupToken;

  String _phone = "";
  get phone => _phone;
  set phone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  bool _major = false;
  get major => _major;
  set major(bool major) {
    _major = major;
    notifyListeners();
  }

  String _password = "";
  get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _firstname = "";
  get firstname => _firstname;
  set firstname(String firstname) {
    _firstname = firstname;
    notifyListeners();
  }

  String _lastname = "";
  get lastname => _lastname;
  set lastname(String lastname) {
    _lastname = lastname;
    notifyListeners();
  }

  String _phoneCode = "";
  get phoneCode => _phoneCode;
  set phoneCode(String phoneCode) {
    _phoneCode = phoneCode;
    notifyListeners();
  }

  SignupState _signupState = SignupState.Empty;
  get signupState => _signupState;
  set signupState(SignupState state) {
    _signupState = state;
    notifyListeners();
  }

  void nextStep() async {
    switch (signupState) {
      // Phone verification
      case SignupState.PhoneInValid:
      case SignupState.Empty:
        {
          signupState = SignupState.PhoneEntered;
          if (await verifyPhone()) {
            signupState = SignupState.PhoneValidated;
          } else {
            errorMsg = "The phone entered couldn't be validated";
            signupState = SignupState.PhoneInValid;
          }
          break;
        }
      // Phone code verification
      case SignupState.PhoneCodeInvalid:
      case SignupState.PhoneValidated:
        {
          signupState = SignupState.PhoneCodeEntered;
          if (await verifyPhoneCode())
            signupState = SignupState.PhoneCodeConfirmed;
          else {
            errorMsg = "The confirmation code you entered is invalid";
            signupState = SignupState.PhoneCodeInvalid;
          }
          break;
        }
      
      // Psw verification
      case SignupState.PhoneCodeConfirmed:
        {
          signupState = SignupState.PswEntered;
          if(verifyPsw()) {
            signupState = SignupState.PswValid;
          } else {
            signupState = SignupState.PswInvalid;
          }
          break;
        }
      
      // Id verification
      case SignupState.PswValid:
        {
          signupState = SignupState.IdEntered;
          break;
        }
    }
  }

  Future<bool> verifyPhone() async {
    if (!isPhoneFormatValid()) return false;
    // need to call the Users/signup/phone api to get the token n shit
    return true;
  }

  bool isPhoneFormatValid() {
    return phone.length >= 10;
  }

  Future<bool> verifyPhoneCode() async {
    return phoneCode == "0000";
  }

  bool isPhoneCodeFormatValid() {
    return phoneCode.length >= 4;
  }

  bool verifyPsw() {
    return password.length > 4;
  }

  bool isFormFormatValid() {
    bool valid = isPhoneCodeFormatValid() && isPhoneFormatValid() && verifyPsw() && major;
    return valid;
  }
}
