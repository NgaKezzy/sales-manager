import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/models/list_order_model.dart';
import 'package:sales_manager/models/order_detail_model.dart';
import 'package:sales_manager/models/order_model.dart';
import 'package:sales_manager/models/product_model.dart';
import 'package:sales_manager/network/fetch_api.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_domain.dart';

class OrderController extends ChangeNotifier {
  List<int> selectedItemList = [];
  List itemPost = [];
  List<ListOrder> listItemOrder = [];
  List<OrderDetail> listItemOrderDetail = [];
  List<Product> elementsProductOfOrderDetail = [];
  int indexProduct = 0;
  List<TextEditingController> listQuantityController = [];

  var quantityController = TextEditingController();
  var customersOrderController = TextEditingController();
  var noteOrderController = TextEditingController();
  var quantityImportProduct = TextEditingController();

  String funds = "Tiền mặt";
  String idOrder = '';
  int sumMoneyImportProduct = 0;

  bool checkFunds = false;

  int totalMoney = 0;
  int sumProduct = 0;
  int indexProductDelete = 0;
  int sumMoneyOrderDetail = 0;
  int totalPriceOrderDetail = 0;

  String dateOrder = DateFormat(
    'yyyy-MM-dd',
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

  void sumPriceOrderDetail() {
    totalPriceOrderDetail = 0;
    for (var i = 0; i < listItemOrderDetail.length; i++) {
      totalPriceOrderDetail += listItemOrderDetail[i].totalPrice;
    }
  }

  void addItemPost(List<Product> value, int index) {
    itemPost.clear();
    for (var i = 0; i < value.length; i++) {
      if (i == index) {
        itemPost.add({
          "productId": value[index].id.toString(),
          "quantityOrder": quantityImportProduct.text,
          "price": value[index].price.toString()
        });
      }
    }
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

  void downQuantity() {
    if (int.parse(quantityImportProduct.text) >= 1) {
      quantityImportProduct.text =
          (int.parse(quantityImportProduct.text) - 1).toString();
    }
  }

  void upQuantity() {
    if (int.parse(quantityImportProduct.text) < 10) {
      quantityImportProduct.text =
          (int.parse(quantityImportProduct.text) + 1).toString();
    }
  }

  void sumMoney(int value) {
    sumMoneyImportProduct = int.parse(quantityImportProduct.text) * value;
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
        dateOrder, funds, 'Khách lẻ', 'X', noteOrder, itemPost);
    if (createOrder['status'] == 'success') {
      Fluttertoast.showToast(msg: '${createOrder['message']}');
    } else {
      Fluttertoast.showToast(msg: '${createOrder['message']}');
    }
  }

  void createOrderImportProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final createOrderImportProduct = await NetworkApi.createOrder(
        idWarehouse ?? '',
        dateOrder,
        'Tiền mặt',
        'Khách lẻ',
        'N',
        'Nhập hàng',
        itemPost);
    if (createOrderImportProduct['status'] == 'success') {
      Fluttertoast.showToast(msg: '${createOrderImportProduct['message']}');
    } else {
      Fluttertoast.showToast(msg: '${createOrderImportProduct['message']}');
    }
    notifyListeners();
  }

  void getListOrder() async {
    final listOrder = await NetworkApi.getListOrder();

    final List<ListOrder> order =
        ListOrder.convertToListOrder(listOrder['data']);
    listItemOrder = order;
    printYellow(listItemOrder.toString());
    notifyListeners();
  }

  void getOrderDetail() async {
    final listOrderDetail = await NetworkApi.getOrderDetail(idOrder);

    final List<OrderDetail> orderDetail =
        OrderDetail.convertToListOrderDetail(listOrderDetail['data']);
    listItemOrderDetail = orderDetail;
    printRed(listItemOrderDetail.length.toString());
  }

  void sumTotalOrderDetail() {
    for (var i = 0; i < listItemOrderDetail.length; i++) {
      sumMoneyOrderDetail += listItemOrderDetail[i].totalPrice;
    }
  }

  void deleteOrder() async {
    final deleteOrder = await NetworkApi.deleteOrder(idOrder);

    if (deleteOrder['status'] == 'success') {
      Fluttertoast.showToast(msg: '${deleteOrder['message']}');
      getListOrder();
    } else {
      Fluttertoast.showToast(msg: '${deleteOrder['message']}');
    }
    notifyListeners();
  }
}
