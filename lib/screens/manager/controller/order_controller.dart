import 'package:flutter/material.dart';
import 'package:sales_manager/models/product_model.dart';

class OrderController extends ChangeNotifier {
  List selectedItemList = [];
  List<TextEditingController> listQuantityController = [];

  var quantityController = TextEditingController();
  var customersOrderController = TextEditingController();
  var noteOrderController = TextEditingController();

  String funds = "Tiền mặt";
  bool checkFunds = false;
  bool checkSelected = false;

  int totalMoney = 0;

  int sumPrice() {
    for (var i = 0; i < selectedItemList.length; i++) {
      totalMoney = totalMoney + int.parse(selectedItemList[i].price);
    }
    return totalMoney;
  }

  void changeQuantityUp(int index) {
    listQuantityController[index].text =
        (int.parse(listQuantityController[index].text) + 1).toString();
    notifyListeners();
  }

  void changeQuantityDown(int index) {
    listQuantityController[index].text =
        (int.parse(listQuantityController[index].text) - 1).toString();
    notifyListeners();
  }

  void addQuantityController() {
    listQuantityController.clear();
    for (var i = 0; i < selectedItemList.length; i++) {
      TextEditingController textEditingController = TextEditingController();
      textEditingController.text = 1.toString();
      listQuantityController.add(textEditingController);
    }
  }
}
