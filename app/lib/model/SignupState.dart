enum SignupState {
  Empty,
  PhoneEntered,
  PhoneValidated,
  PhoneInValid,
  PhoneCodeEntered,  
  PhoneCodeConfirmed,
  PhoneCodeInvalid,
  PswEntered,
  PswValid,
  PswInvalid,
  IdEntered,
  SignedUp,
  SignupFailed,
}

class SignupContext {
  String msg;
  SignupState state;
  SignupContext({this.msg, this.state});
}