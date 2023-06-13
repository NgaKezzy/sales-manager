import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_domain.dart';
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
      if (response.statusCode == 401) {
        var data = jsonDecode(response.body);
        result = data;
      }

      return result;
    } catch (e) {
      print(e);
      return result;
    }
  }

  static Future<Map> registerApi(String userName, String password) async {
    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.AUTH_REGISTER);
    Map resultRegister = {};
    try {
      final response = await http.post(uri, body: {
        "username": userName,
        "password": password,
      });

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        resultRegister = data;
      }
      if (response.statusCode == 409) {
        var data = jsonDecode(response.body);
        resultRegister = data;
      }
      return resultRegister;
    } catch (e) {
      print('Đây là lỗi : $e');
      return resultRegister;
    }
  }
}
