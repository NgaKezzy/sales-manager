import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config/print_color.dart';
import '../../../models/user_register.dart';
import '../../../network/fetch_api.dart';

class RegisterController extends ChangeNotifier {
  final formKeyRegister = GlobalKey<FormState>();

  final userName = TextEditingController();
  final passOne = TextEditingController();
  final PassTwo = TextEditingController();

  UserRegister? _userRegister;
  UserRegister? get userRegister => _userRegister;

  String? validatorRegister(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập dữ liệu';
    }
    return null;
  }

  void submitRegister(BuildContext context) async {
    if (formKeyRegister.currentState!.validate()) {
      if (passOne.text != PassTwo.text) {
        log(passOne.text);
        log(PassTwo.text);
        Fluttertoast.showToast(msg: 'Mật khẩu không trùng nhau');
        printRed('Mật khẩu không khớp nhau');
      }
    }
    if (passOne.text == PassTwo.text) {
      printRed('hi');
      final userNameRegister = userName.text.trim();
      final passwordRegister = passOne.text;

      final dataRegister =
          await NetworkApi.registerApi(userNameRegister, passwordRegister);
      log(dataRegister.toString());
      if (dataRegister['status'] == 'success') {
        Fluttertoast.showToast(msg: dataRegister['message']);
      }
    }
  }
}
