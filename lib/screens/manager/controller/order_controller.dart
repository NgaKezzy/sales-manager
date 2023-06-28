import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/models/product_model.dart';
import 'package:sales_manager/network/fetch_api.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_domain.dart';

class OrderController extends ChangeNotifier {
  List<int> selectedItemList = [];
  List itemPost = [];
  int indexProduct = 0;
  List<TextEditingController> listQuantityController = [];

  var quantityController = TextEditingController();
  var customersOrderController = TextEditingController();
  var noteOrderController = TextEditingController();

  String funds = "Tiền mặt";

  bool checkFunds = false;

  int totalMoney = 0;
  int sumProduct = 0;
  int indexProductDelete = 0;

  String dateOrder = DateFormat(
    'dd/MM/yyyy',
  ).format(DateTime.now());

  void setDateTimeOrder(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) => {dateOrder = value.toString().split(' ')[0]});
  }

  void convertToListProduct(List<Product> value) {
    itemPost.clear();
    for (var i = 0; i < selectedItemList.length; i++) {
      int index = selectedItemList[i];

      itemPost.add({
        "productId": value[index].id.toString(),
        "quantityOrder": listQuantityController[i].text,
        "price": value[index].price.toString()
      });
    }

    notifyListeners();
  }

// hàm tính tổng tiền của đơn hàng

  void sumPrice(List<Product> value) {
    totalMoney = 0;
    sumProduct = 0;
    for (var i = 0; i < selectedItemList.length; i++) {
      int index = selectedItemList[i];
      totalMoney +=
          value[index].price * int.parse(listQuantityController[i].text);
    }
    sumProduct = selectedItemList.length;
  }

  void changeQuantityUp(int index) {
    if (int.parse(listQuantityController[index].text) >= 1) {
      listQuantityController[index].text =
          (int.parse(listQuantityController[index].text) + 1).toString();
    }
    notifyListeners();
  }

  void changeQuantityDown(int index) {
    if (int.parse(listQuantityController[index].text) > 1) {
      listQuantityController[index].text =
          (int.parse(listQuantityController[index].text) - 1).toString();
    }
    notifyListeners();
  }

  void addQuantityController() {
    listQuantityController.clear();
    for (var i = 0; i < selectedItemList.length; i++) {
      TextEditingController textEditingController = TextEditingController();
      textEditingController.text = 1.toString();
      listQuantityController.add(textEditingController);
    }
    printGreen('số textController = ${listQuantityController.length}');
  }

  void createOrder() async {
    final String customerOrder = customersOrderController.text;
    final String noteOrder = noteOrderController.text;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final createOrder = await NetworkApi.createOrder(idWarehouse ?? '',
        dateOrder, funds, customerOrder, 'N', noteOrder, itemPost);
    if (createOrder['status'] == 'success') {
      Fluttertoast.showToast(msg: '${createOrder['message']}');
    } else {
      Fluttertoast.showToast(msg: '${createOrder['message']}');
    }
  }
}
