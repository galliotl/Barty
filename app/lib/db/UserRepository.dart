import 'dart:convert';
import 'package:barty/model/LoginState.dart';
import 'package:barty/model/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final String authUrl = "http://192.168.0.24:8000"; // my local ip with the opened docker port to change for u
  final storage = new FlutterSecureStorage();

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
    http.Response response;
    body = json.encode(body);
    try {
      response = await http.post("$authUrl/users/login", body: body, headers: {"Content-Type": "application/json"});
    } catch (err) {
      print(err);
      return LoginContext(state: LoginState.LoginFailed, msg: "Something went wrong...");
    }

    // handle errors
    if(response.statusCode != 200) {
      print(response.body);
      return LoginContext(state: LoginState.LoginFailed, msg: "Password or username incorrect");
    }

    var responseBody = json.decode(response.body);

    var token = responseBody["token"];

    if (token == null) {
      return LoginContext(state: LoginState.LoginFailed, msg: "Something went wrong...");
    }
    await persistToken(token);
    return LoginContext(state: LoginState.LoginSucceded);
  }

  Future<User> fetchUserData(String phone) async {
    return User.fakeConnectedUser();
  }
}
