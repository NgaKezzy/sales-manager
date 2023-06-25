import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sales_manager/config/print_color.dart';
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
  static Future<Map> getProdcut(String idWarehouse) async {
    var uri =
        Uri.https(AppDomains.BASE_URL, AppDomains.WAREHOUSE + idWarehouse);
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

  // gọi api để tạo sản phẩm
  static Future<Map> createProduct(
      String idWarehouse,
      String productName,
      String productImage,
      int importPrice,
      int price,
      int inventoryNumber,
      int quantity) async {
    Map resultCreateProduct = {};
    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.WAREHOUSE);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);

    try {
      final response = await http.post(uri, headers: {
        'token_access_authorization': accessToken ?? '',
      }, body: {
        "warehouseId": idWarehouse,
        "productName": productName,
        "productImage": productImage,
        "importPrice": importPrice.toString(),
        "price": price.toString(),
        "inventoryNumber": inventoryNumber.toString(),
        "quantity": quantity.toString(),
      });
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        resultCreateProduct = data;
      }
      if (response.statusCode == 401) {
        var data = jsonDecode(response.body);
        resultCreateProduct = data;
      }
    } catch (e) {
      printRed('Bắt lỗi khi gọi api : ' + e.toString());
    }
    return resultCreateProduct;
  }

  // gọi api để xóa sản phẩm
  static Future<Map> deleteProduct(String productId) async {
    Map resultDeleteProduct = {};
    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.DELETE);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);

    try {
      final response = await http.post(uri, headers: {
        'token_access_authorization': accessToken ?? '',
      }, body: {
        "productId": productId,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        resultDeleteProduct = data;
      }
      if (response.statusCode == 401) {
        var data = jsonDecode(response.body);
        resultDeleteProduct = data;
      } else {
        var data = jsonDecode(response.body);
        resultDeleteProduct = data;
      }
    } catch (e) {
      printBlue('Đây là lỗi bắt ngoại lệ xóa sản phẩm: + ${e}');
    }
    return resultDeleteProduct;
  }

  // gọi api để cập nhật sản phẩm
  static Future<Map> updateProduct(
      String productId,
      String productName,
      String productImage,
      int importPrice,
      int price,
      int inventoryNumber) async {
    Map resultUpdateProduct = {};

    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.UPDATE_PRODUCT);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);

    try {
      final response = await http.post(uri, headers: {
        'token_access_authorization': accessToken ?? '',
      }, body: {
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "importPrice": importPrice.toString(),
        "price": price.toString(),
        "inventoryNumber": inventoryNumber.toString(),
      });
      switch (response.statusCode) {
        case 200:
          {
            var data = jsonDecode(response.body);
            resultUpdateProduct = data;
          }
          break;
        case 401:
          {
            var data = jsonDecode(response.body);
            resultUpdateProduct = data;
          }
          break;
        default:
          {
            var data = jsonDecode(response.body);
            resultUpdateProduct = data;
          }
          break;
      }
    } catch (e) {
      printCyan('Đây là lỗi bắt ngoại lệ khi cập nhật sản phẩm ${e}');
    }
    return resultUpdateProduct;
  }
}
