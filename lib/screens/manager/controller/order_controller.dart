import 'package:flutter/material.dart';
import 'package:sales_manager/models/product_model.dart';

class OrderController extends ChangeNotifier {
  List selectedItemList = [];
  var quantityController = TextEditingController();
  var customersOrderController = TextEditingController();
  var noteOrderController = TextEditingController();

  String funds = "Tiền mặt";
  bool checkFunds = false;
  bool checkSelected = false;

  int totalMoney = 0;

  int sumPrice(int quantity, int price) {
    totalMoney = quantity * price;
    return totalMoney;
  }

  void changeQuantityUp() {
    if (int.parse(quantityController.text) >= 1) {
      int.parse(quantityController.text) + 1;
    }
    notifyListeners();
  }

  void changeQuantityDown() {
    if (int.parse(quantityController.text) > 1) {
      int.parse(quantityController.text) - 1;
    }
    notifyListeners();
  }
}
