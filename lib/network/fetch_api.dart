import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_api_path.dart';
import '../models/user_login.dart';

class NetworkApi {
  NetworkApi._();
  static Future<Map> logInApi(String userName, String password) async {
    var uri = Uri.https(
      AppDomains.BASE_URL,
      AppDomains.AUTH_LOGIN,
    );
    Map result = {};
    try {
      final response = await http.post(uri, body: {
        "username": userName,
        "password": password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        result = data;
      }
      return result;
    } catch (e) {
      print(e);
      return result;
    }
  }
}
