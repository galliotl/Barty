import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AppAPI {
  // my local ip with the opened docker port -> change for u
  final String backendUrl = "http://192.168.0.24:8000";
  final storage = FlutterSecureStorage();
  String token;

  Future<Map> post(route, body) async {
    body = json.encode(body);
    String token = await getAuthToken();
    var headers = {
      "Content-Type": "application/json",
    };
    if (token != null) {
      headers["Authorization"] = "Token $token";
    }
    http.Response response =
        await http.post("$backendUrl$route", body: body, headers: headers);
    return {
      "body": json.decode(response.body),
      "statusCode": response.statusCode
    };
  }

  Future<Map> get(route) async {
    String token = await getAuthToken();

    http.Response response = await http
        .get("$backendUrl$route", headers: {"Authorization": "Token $token"});
    return {
      "body": json.decode(response.body),
      "statusCode": response.statusCode
    };
  }

  Future<String> getAuthToken() async {
    if (this.token == null) {
      this.token = await storage.read(key: "auth_token");
    }
    return this.token;
  }
}
