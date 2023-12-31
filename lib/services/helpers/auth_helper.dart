import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:jobhub/models/request/auth/login_model.dart';
import 'package:jobhub/models/request/auth/profile_update_model.dart';
import 'package:jobhub/models/response/auth/login_res_model.dart';
import 'package:jobhub/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {"Content-Type": 'application/json'};
    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );

    if (response.statusCode == 200) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      String token = loginResponseModelFromJson(response.body).userToken;
      String userId = loginResponseModelFromJson(response.body).id;
      String profile = loginResponseModelFromJson(response.body).profile;

      await sharedPreferences.setString("token", token);
      await sharedPreferences.setString("userId", userId);
      await sharedPreferences.setString("profile", profile);
      await sharedPreferences.setBool("loggedIn", true);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateProfile(
      ProfileUpdateReq model, String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    Map<String, String> requestHeaders = {
      "Content-Type": 'application/json',
      'token': 'Bearer $token'
    };
    var url = Uri.https(Config.apiUrl, "${Config.profileUrl}/$userId");
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
