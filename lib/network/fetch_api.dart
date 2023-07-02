import 'dart:convert';
import 'dart:developer';
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
    // var uri = Uri.http(
    //   AppDomains.BASE_URL,
    //   AppDomains.AUTH_LOGIN,
    // );
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
    // var uri = Uri.https(AppDomains.BASE_URL, AppDomains.AUTH_REGISTER);
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
  static Future<Map> getProduct(String idWarehouse) async {
    var uri =
        Uri.https(AppDomains.BASE_URL, AppDomains.WAREHOUSE + idWarehouse);
    // var uri = Uri.http(AppDomains.BASE_URL, AppDomains.WAREHOUSE + idWarehouse);
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
    // var uri = Uri.http(AppDomains.BASE_URL, AppDomains.WAREHOUSE);

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
    // var uri = Uri.http(AppDomains.BASE_URL, AppDomains.DELETE);

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
    // var uri = Uri.http(AppDomains.BASE_URL, AppDomains.UPDATE_PRODUCT);

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

  // gọi API tạo đơn hàng
  static Future<Map> createOrder(
      String idWarehouse,
      String purchaseDate,
      String funds,
      String customerName,
      String bill,
      String noteOrder,
      List listProduct) async {
    Map resultCreateOrder = {};
    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.ORDER);
    // var uri = Uri.http(AppDomains.BASE_URL, AppDomains.ORDER);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);

    Map put = {
      "idWarehouse": idWarehouse,
      "purchaseDate": purchaseDate,
      "funds": funds,
      "customerName": customerName,
      "bill": bill,
      "noteOrder": noteOrder,
      "listProduct": jsonEncode(listProduct)
    };

    log(jsonEncode(put));

    try {
      final response = await http.post(
        uri,
        headers: {
          'token_access_authorization': accessToken ?? '',
          'content_type': 'application/x-www-form-urlencoded',
        },
        body: put,
      );
      switch (response.statusCode) {
        case 200:
          {
            var data = jsonDecode(response.body);
            resultCreateOrder = data;
          }
          break;
        case 401:
          {
            var data = jsonDecode(response.body);
            resultCreateOrder = data;
          }
          break;
        default:
          {
            var data = jsonDecode(response.body);
            resultCreateOrder = data;
          }
      }
    } catch (e) {
      printCyan('Đây là lỗi bắt ngoại lệ khi tạo đơn hàng ${e}');
    }
    return resultCreateOrder;
  }

  // gọi API để lấy ra danh sách các hóa đơn
  static Future<Map> getListOrder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    Map resultListOrder = {};

    var uri = Uri.https(
      AppDomains.BASE_URL,
      AppDomains.GET_ORDER + idWarehouse!,
    );

    try {
      final response = await http.get(uri, headers: {
        'token_access_authorization': accessToken ?? '',
      });
      switch (response.statusCode) {
        case 200:
          {
            var data = jsonDecode(response.body);
            resultListOrder = data;
          }
          break;
        case 401:
          {
            var data = jsonDecode(response.body);
            resultListOrder = data;
          }
          break;
        case 400:
          {
            var data = jsonDecode(response.body);
            resultListOrder = data;
          }
          break;
        default:
          {
            var data = jsonDecode(response.body);
            resultListOrder = data;
          }
      }
    } catch (e) {
      printBlue('Đây là lỗi bắt ngoại lệ khi lấy danh sách hóa đơn xuống: $e ');
    }
    return resultListOrder;
  }

  // call API get Order detail

  static Future<Map> getOrderDetail(
    String idOrder,
  ) async {
    Map resultOrderDetail = {};

    var uri =
        Uri.https(AppDomains.BASE_URL, AppDomains.GET_DETAIL_ORDER + idOrder);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);

    try {
      final response = await http.get(uri, headers: {
        'token_access_authorization': accessToken ?? '',
      });
      switch (response.statusCode) {
        case 200:
          {
            var data = jsonDecode(response.body);
            resultOrderDetail = data;
          }
          break;
        case 400:
          {
            var data = jsonDecode(response.body);
            resultOrderDetail = data;
          }
          break;
        case 404:
          {
            var data = jsonDecode(response.body);
            resultOrderDetail = data;
          }
          break;
        default:
          {
            var data = jsonDecode(response.body);
            resultOrderDetail = data;
          }
          break;
      }
    } catch (e) {
      printRed('Ngoại lệ khi lấy chi tiết đơn hàng ${e}');
    }
    return resultOrderDetail;
  }

  // call API Delete order
  static Future<Map> deleteOrder(String orderId) async {
    Map resultDeleteOrder = {};
    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.DELETE_ORDER);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);

    try {
      final response = await http.post(uri, headers: {
        'token_access_authorization': accessToken ?? '',
      }, body: {
        "orderId": orderId,
      });

      switch (response.statusCode) {
        case 200:
          {
            var data = jsonDecode(response.body);
            resultDeleteOrder = data;
          }

          break;
        case 400:
          {
            var data = jsonDecode(response.body);
            resultDeleteOrder = data;
          }

          break;
        default:
          {
            var data = jsonDecode(response.body);
            resultDeleteOrder = data;
          }
          break;
      }
    } catch (e) {
      printBlue('Bắt ngoại lệ khi xóa đơn hàng ${e}');
    }
    return resultDeleteOrder;
  }

  // CAll API create spendings
  static Future<Map> createSpendings(
      String idOrder,
      String idWareHouse,
      String revenueDate,
      String revenueFund,
      String revenueMoney,
      String revenueNote,
      String type) async {
    Map resultCreateSpendings = {};

    var uri = Uri.https(AppDomains.BASE_URL, AppDomains.CREATE_SPENDINGS);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(AppDomains.ACCESS_TOKEN);
    try {
      final response = await http.post(uri, headers: {
        'token_access_authorization': accessToken ?? '',
      }, body: {
        "idOrder": idOrder,
        "idWareHouse": idWareHouse,
        "revenueDate": revenueDate,
        "revenueFund": revenueFund,
        "revenueMoney": revenueMoney,
        "revenueNote": revenueNote,
        "type": type,
      });

      switch (response.statusCode) {
        case 200:
          {
            var data = jsonDecode(response.body);
            resultCreateSpendings = data;
          }
          break;
        case 400:
          {
            var data = jsonDecode(response.body);
            resultCreateSpendings = data;
          }
          break;
        default:
          {
            var data = jsonDecode(response.body);
            resultCreateSpendings = data;
          }
          break;
      }
    } catch (e) {
      printRed('Bắt ngoại lệ kgi tạo khoản thu chi ${e}');
    }
    return resultCreateSpendings;
  }
}
