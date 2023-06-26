import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_manager/models/product_model.dart';
import 'package:sales_manager/network/fetch_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_domain.dart';

class ProductsController extends ChangeNotifier {
  String idProduct = "";
  String nameProduct = "";
  int indexProduct = 0;
  List<Product> resultProducts = [];
  final keyCreateProduct = GlobalKey<FormState>();
  final keyUpdateProduct = GlobalKey<FormState>();

  final nameProdcutController = TextEditingController();
  final quantityProdcutController = TextEditingController();
  final priceProdcutController = TextEditingController();
  final importPriceProdcutController = TextEditingController();

  var nameUpdateController = TextEditingController();
  var priceUpdateController = TextEditingController();
  var importPriceUpdateController = TextEditingController();
  var inventoryNumberUpdateController = TextEditingController();

  bool isLoading = false;

  void getDataProducts(String idWarehouse) async {
    final dataProducts = await NetworkApi.getProdcut(idWarehouse);

    final List<Product> product =
        Product.convertToProduct(dataProducts['data']);
    resultProducts = product;
    log('Đây là số lượng sản phẩm :' + resultProducts.length.toString());
    isLoading = true;
    notifyListeners();
  }

  double totalValue() {
    double sum = 0;
    for (int i = 0; i < resultProducts.length; i++) {
      sum += (resultProducts[i].price * resultProducts[i].quantity);
    }
    return sum;
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập dữ liệu';
    }
    return null;
  }

  void createProduct() async {
    if (keyCreateProduct.currentState!.validate()) {
      final String productName = nameProdcutController.text;
      final int importPrice = int.parse(importPriceProdcutController.text);
      final int price = int.parse(priceProdcutController.text);
      final int inventoryNumber = int.parse(quantityProdcutController.text);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

      log('Đây là id warehouse : ' + idWarehouse.toString());

      final createOneProduct = await NetworkApi.createProduct(idWarehouse ?? '',
          productName, '', importPrice, price, inventoryNumber, 0);
      if (createOneProduct['status'] == 'success') {
        getDataProducts(idWarehouse!);
        Fluttertoast.showToast(msg: 'Tạo thành công sản phẩm.');
      } else {
        Fluttertoast.showToast(msg: 'Tạo sản phẩm thất bại !');
      }
    }
  }

  void deleteProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final deleteProduct = await NetworkApi.deleteProduct(idProduct);

    if (deleteProduct['status'] == 'success') {
      getDataProducts(idWarehouse!);
      Fluttertoast.showToast(msg: '${deleteProduct['message']}');
    } else {
      Fluttertoast.showToast(msg: '${deleteProduct['message']}');
    }
  }

  void updateProduct(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final String productName = nameUpdateController.text;
    final int importPrice = int.parse(importPriceUpdateController.text);
    final int price = int.parse(priceUpdateController.text);
    final int inventoryNumber = int.parse(inventoryNumberUpdateController.text);

    final updateProduct = await NetworkApi.updateProduct(
        idProduct, productName, '', importPrice, price, inventoryNumber);
    if (updateProduct['status'] == 'success') {
      getDataProducts(idWarehouse!);
      // nameUpdateController.text = '';
      // priceUpdateController.text = '';
      // importPriceUpdateController.text = '';
      // inventoryNumberUpdateController.text = '';
      Fluttertoast.showToast(msg: '${updateProduct['message']}');
    } else {
      Fluttertoast.showToast(msg: 'Cập nhật sản phẩm thất bại !');
    }

    notifyListeners();
  }
}
