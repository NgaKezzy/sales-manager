import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_manager/config/app_domain.dart';
import 'package:sales_manager/models/user_login.dart';
import 'package:sales_manager/network/fetch_api.dart';
import 'package:sales_manager/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/print_color.dart';

class AuthController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userName = TextEditingController();
  final passOne = TextEditingController();
  final PassTwo = TextEditingController();

  UserLogin? _userLogin;
  UserLogin? get userLogin => _userLogin;

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

      final dataLogin = await NetworkApi.logInApi(userName, password);

      log(dataLogin.toString());

      if (dataLogin['status'] == 'success') {
        Fluttertoast.showToast(msg: dataLogin['message']);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            AppDomains.ACCESS_TOKEN, dataLogin['data']['accessToken']);
        await prefs.setString(
            AppDomains.REFRESH_TOKEN, dataLogin['data']['refreshToken']);

        final UserLogin userLogin =
            UserLogin.fromJson(dataLogin['data']['dataUser']);
        _userLogin = userLogin;
        _isLogin = true;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          ModalRoute.withName('/first'),
        );
      }
      if (dataLogin['status'] == 'error') {
        Fluttertoast.showToast(msg: dataLogin['message']);
      }
    }

    notifyListeners();
  }

  void LogOut() async {
    _isLogin = false;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(AppDomains.ACCESS_TOKEN);
    await prefs.remove(AppDomains.REFRESH_TOKEN);
    Fluttertoast.showToast(msg: 'Đăng xuất thành công !');

    notifyListeners();
  }

  void submitRegister(BuildContext context) async {
    final userNameRegister = userName.text.trim();
    final passwordRegister = passOne.text;
    final passwordTwoRegister = PassTwo.text;
    if (formKey.currentState!.validate()) {
      if (passwordRegister != passwordTwoRegister) {
        printRed('Mật khẩu không khớp nhau');

        Fluttertoast.showToast(msg: 'Mật khẩu không trùng nhau');
      }
    }
    if (passOne.text == PassTwo.text) {
      printYellow('Mật khẩu giống nhau');

      final dataRegister =
          await NetworkApi.registerApi(userNameRegister, passwordRegister);
      log(dataRegister.toString());
      if (dataRegister['status'] == 'success') {
        Fluttertoast.showToast(msg: dataRegister['message']);
      }
      if (dataRegister['status'] == 'error') {
        Fluttertoast.showToast(msg: dataRegister['message']);
      }
    }
  }
}
