import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_domain.dart';
import '../models/user_login.dart';

class NetworkApi {
  NetworkApi._();

  // gọi api để đăng nhập
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

// goij api  để đăng ký tài khoản
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

// gọi api để lấy ra tất cả sản phẩm
  static Future<Map> getProdcut(String idWarehose) async {
    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.WAREHOUSE + idWarehose);
    Map resultProducts = {};
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);

    try {
      final response = await http
          .get(uri, headers: {'token_access_authorization': accessToken ?? ''});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        resultProducts = data;
      }
    } catch (e) {
      print(e);
    }
    return resultProducts;
  }
}
