import 'package:barty/db/UserRepository.dart';
import 'package:barty/model/SignupState.dart';
import 'package:flutter/foundation.dart';


/// This provider model stores all the variables concerning
/// the signup process. All the fileds' data and especially
/// the current step (phone, code, psw...) so we can manage
/// switching from one step to another independently from
/// the view for a better separation of concerns
class SignupModel extends ChangeNotifier {

  final userRepository = UserRepository();
  
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

  String receivedPhoneCode;
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
            phone="";
          }
          break;
        }
      // Phone code verification
      case SignupState.PhoneCodeInvalid:
      case SignupState.PhoneValidated:
        {
          signupState = SignupState.PhoneCodeEntered;
          if (verifyPhoneCode())
            signupState = SignupState.PhoneCodeConfirmed;
          else {
            errorMsg = "The confirmation code you entered is invalid";
            signupState = SignupState.PhoneCodeInvalid;
            phoneCode="";
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
            password = "";
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
    Map codeAndToken = await userRepository.getPhoneCodeAndToken(phone);
    if(codeAndToken == null) {
      // error
      errorMsg = "could not verify the phone";
      return false;
    }
    signupToken = codeAndToken['token'];
    receivedPhoneCode = codeAndToken['code'];
    return true;
  }

  bool isPhoneFormatValid() {
    return phone.length >= 10;
  }

  bool verifyPhoneCode() {
    return phoneCode == receivedPhoneCode;
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
