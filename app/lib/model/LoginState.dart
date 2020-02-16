enum LoginState {
  Empty ,
  LoginEntered,
  LoginFailed,
  LoginSucceded,
}

class LoginContext {
  String msg;
  LoginState state;
  LoginContext({this.msg, this.state});
}