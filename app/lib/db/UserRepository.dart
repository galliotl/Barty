import 'package:barty/db/AppAPI.dart';
import 'package:barty/model/LoginState.dart';
import 'package:barty/model/SignupState.dart';
import 'package:barty/model/User.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final storage = FlutterSecureStorage();
  final api = AppAPI();

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await storage.delete(key: 'auth_token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await storage.write(key: "auth_token", value: token);
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    String token = await storage.read(key: "auth_token");
    return token != null;
  }

  Future<LoginContext> loginUser(String phone, String password) async {
    dynamic body = {"phone": phone, "password": password};
    Map response;
    try {
      response = await api.post("/users/login", body);
    } catch (err) {
      print(err);
      return LoginContext(
          state: LoginState.LoginFailed, msg: "Something went wrong...");
    }

    // handle errors
    if (response['statusCode'] != 200) {
      print(response['body']);
      return LoginContext(
          state: LoginState.LoginFailed, msg: "Password or username incorrect");
    }

    var token = response['body']["token"];

    if (token == null) {
      return LoginContext(
          state: LoginState.LoginFailed, msg: "Something went wrong...");
    }
    await persistToken(token);
    return LoginContext(state: LoginState.LoginSucceded);
  }

  Future<SignupContext> signupUser(
      {@required String name,
      @required String password,
      @required String signupToken,
      @required bool isMajor,
      @required bool isPhoneConfirmed}) async {
    dynamic body = {
      "name": name,
      "token": signupToken,
      "password": password,
      "isMajor": isMajor,
      "isPhoneConfirmed": isPhoneConfirmed,
    };
    Map response;
    try {
      response = await api.post("/users/signup", body);
    } catch (err) {
      print(err);
      return SignupContext(
          state: SignupState.SignupFailed, msg: "Something went wrong...");
    }

    // handle errors
    if (response['statusCode'] != 200) {
      print(response['body']);
      return SignupContext(
          state: SignupState.SignupFailed,
          msg: "Password or username incorrect");
    }

    var token = response['body']["token"];

    if (token == null) {
      return SignupContext(
          state: SignupState.SignupFailed, msg: "Something went wrong...");
    }
    await persistToken(token);
    return SignupContext(state: SignupState.SignedUp);
  }

  Future<Map> getPhoneCodeAndToken(String phone) async {
    try {
      Map response = await api.post('/users/signup/phone', {"phone": phone});
      if (response["statusCode"] == 200) {
        return {
          'token': response["body"]["token"],
          'code': response["body"]["confirmationCode"],
        };
      } else
        return null;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<User> fetchUserData(String phone) async {
    // todo: make user.fromJson()
    return User.fakeConnectedUser();
  }
}
