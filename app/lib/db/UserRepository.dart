import 'dart:convert';

import 'package:barty/model/LoginState.dart';
import 'package:barty/model/SignupState.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:barty/db/apiConstants.dart' as apiCsts;

class UserRepository {
  final storage = FlutterSecureStorage();

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
    String body = json.encode({"phone": phone, "password": password});
    http.Response response;

    try {
      response = await http
          .post("${apiCsts.backendUrl}/users/login", body: body, headers: {
        "Content-Type": "application/json",
      });
    } catch (err) {
      print(err);
      return LoginContext(
          state: LoginState.LoginFailed, msg: "Something went wrong...");
    }

    // handle errors
    if (response.statusCode != 200) {
      print(response.body);
      return LoginContext(
          state: LoginState.LoginFailed, msg: "Password or username incorrect");
    }

    var responseBody = json.decode(response.body);
    var token = responseBody['token'];

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
    String body = json.encode({
      "name": name,
      "password": password,
      "isMajor": isMajor,
      "isPhoneConfirmed": isPhoneConfirmed,
    });
    http.Response response;

    try {
      response = await http
          .post("${apiCsts.backendUrl}/users/signup", body: body, headers: {
        "Content-Type": "application/json",
        "Authorization": "Token $signupToken",
      });
    } catch (err) {
      print(err);
      return SignupContext(
          state: SignupState.SignupFailed, msg: "Something went wrong...");
    }

    // handle errors
    if (response.statusCode != 200) {
      print(response.body);
      return SignupContext(
          state: SignupState.SignupFailed,
          msg: "Password or username incorrect");
    }

    var responseBody = json.decode(response.body);
    var token = responseBody['token'];

    if (token == null) {
      return SignupContext(
          state: SignupState.SignupFailed, msg: "Something went wrong...");
    }
    await persistToken(token);
    return SignupContext(state: SignupState.SignedUp);
  }

  Future<Map> getPhoneCodeAndToken(String phone) async {
    try {
      http.Response response = await http.post(
          '${apiCsts.backendUrl}/users/signup/phone',
          body: json.encode({"phone": phone}),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        return {
          'token': responseBody["token"],
          'code': responseBody["confirmationCode"],
        };
      } else
        return null;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
