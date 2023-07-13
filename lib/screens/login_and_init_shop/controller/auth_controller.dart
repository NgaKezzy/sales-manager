import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_domain.dart';
import 'package:sales_manager/models/user_login.dart';
import 'package:sales_manager/network/fetch_api.dart';
import 'package:sales_manager/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/print_color.dart';

class AuthController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  final formKeyUpdateStore = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userName = TextEditingController();
  final passOne = TextEditingController();
  final PassTwo = TextEditingController();
  var shopNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var descriptionController = TextEditingController();

  String dataUserName = '';
  String dataPassword = '';
  String networkAvatar = '';
  String urlAvatar = '';
  UserLogin? _userLogin;
  UserLogin? get userLogin => _userLogin;
  UserLogin? dataAutoLogin;

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString(AppDomains.ACCESS_TOKEN);

    if (token != null) {
      _isLogin = true;
    }
    notifyListeners();
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập dữ liệu';
    }
    return null;
  }

  void logIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final String userName = userNameController.text.trim();
      final String password = passwordController.text;

      dataUserName = userNameController.text.trim();
      dataPassword = passwordController.text;

      final dataLogin = await NetworkApi.logInApi(userName, password);

      log(dataLogin.toString());

      if (dataLogin['status'] == 'success') {
        Fluttertoast.showToast(msg: dataLogin['message']);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            AppDomains.ACCESS_TOKEN, dataLogin['data']['accessToken']);
        await prefs.setString(
            AppDomains.REFRESH_TOKEN, dataLogin['data']['refreshToken']);

        await prefs.setString(AppDomains.ID_WAREHOUSE,
            dataLogin['data']['dataUser']['idWarehouse']);

        await prefs.setString(
            AppDomains.ID_User, dataLogin['data']['dataUser']['userId']);

        networkAvatar = dataLogin['data']['dataUser']['avatar'];

        final UserLogin userLogin =
            UserLogin.fromJson(dataLogin['data']['dataUser']);
        _userLogin = userLogin;
        _isLogin = true;
        dataAutoLogin = userLogin;
      }
      if (dataLogin['status'] == 'error') {
        Fluttertoast.showToast(msg: dataLogin['message']);
      }
    }
    notifyListeners();
  }

  void refreshDataLogin() async {
    final dataLogin = await NetworkApi.logInApi(dataUserName, dataPassword);
    if (dataLogin['status'] == 'success') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          AppDomains.ACCESS_TOKEN, dataLogin['data']['accessToken']);
      await prefs.setString(
          AppDomains.REFRESH_TOKEN, dataLogin['data']['refreshToken']);

      await prefs.setString(AppDomains.ID_WAREHOUSE,
          dataLogin['data']['dataUser']['idWarehouse']);

      await prefs.setString(
          AppDomains.ID_User, dataLogin['data']['dataUser']['userId']);

      networkAvatar = dataLogin['data']['dataUser']['avatar'];

      final UserLogin userLogin =
          UserLogin.fromJson(dataLogin['data']['dataUser']);
      _userLogin = userLogin;
    }
  }

  void LogOut() async {
    _isLogin = false;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(AppDomains.ACCESS_TOKEN);
    await prefs.remove(AppDomains.REFRESH_TOKEN);
    await prefs.remove(AppDomains.ID_WAREHOUSE);
    await prefs.remove(AppDomains.ID_User);
    urlAvatar = '';
    networkAvatar = '';

    notifyListeners();
  }

  void submitRegister(BuildContext context) async {
    final userNameRegister = userName.text.trim();
    final passwordRegister = passOne.text;
    final passwordTwoRegister = PassTwo.text;

    if (formKeyRegister.currentState!.validate()) {
      if (passwordRegister != passwordTwoRegister) {
        printRed('Mật khẩu không khớp nhau');

        Fluttertoast.showToast(msg: 'Mật khẩu không trùng nhau');
      }
    }
    if (passOne.text == PassTwo.text) {
      printYellow('Mật khẩu giống nhau');
      if (passwordRegister.length >= 4 && userNameRegister.length >= 4) {
        final dataRegister =
            await NetworkApi.registerApi(userNameRegister, passwordRegister);
        log(dataRegister.toString());
        if (dataRegister['status'] == 'success') {
          Fluttertoast.showToast(msg: dataRegister['message']);
          userName.text = '';
          passOne.text = '';
          PassTwo.text = '';
        }
        if (dataRegister['status'] == 'error') {
          Fluttertoast.showToast(msg: dataRegister['message']);
        } else {
          Fluttertoast.showToast(msg: 'Đăng ký thất bại !');
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Tài khoản và mật khẩu phải lớn hơn 4 ký tự');
      }
    }
  }

  Future<void> updateStoreInformation(String linkImg) async {
    if (formKeyUpdateStore.currentState!.validate()) {
      final shopName = shopNameController.text;
      final address = addressController.text;
      final description = descriptionController.text;
      final phone = phoneController.text;

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? idWarehouse = prefs.getString(AppDomains.ID_User);

      final updateStoreInformation = await NetworkApi.updateStoreInformation(
          idWarehouse ?? '', shopName, address, description, phone, linkImg);
      if (updateStoreInformation['status'] == 'success') {
        Fluttertoast.showToast(msg: updateStoreInformation['message']);
      } else {
        Fluttertoast.showToast(msg: updateStoreInformation['message']);
      }
    }
  }
}
