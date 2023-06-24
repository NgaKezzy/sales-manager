import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_manager/models/product_model.dart';
import 'package:sales_manager/network/fetch_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/app_domain.dart';

class ProductsController extends ChangeNotifier {
  List resultProducts = [];
  final keyCreateProduct = GlobalKey<FormState>();

  final nameProdcutController = TextEditingController();
  final quantityProdcutController = TextEditingController();
  final priceProdcutController = TextEditingController();
  final importPriceProdcutController = TextEditingController();

  bool isLoading = false;

  void getdataProducts(String idWarehouse) async {
    final dataProducts = await NetworkApi.getProdcut(idWarehouse);

    final List<Product> product =
        Product.convertToProduct(dataProducts['data']);
    resultProducts = product;
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
      final int quantity = int.parse(quantityProdcutController.text);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

      log('Đây là id warehouse : ' + idWarehouse.toString());

      final createOneProduct = await NetworkApi.createProduct(
          idWarehouse ?? '', productName, '', importPrice, price, 0, quantity);
      if (createOneProduct['status'] == 'success') {
        getdataProducts(idWarehouse!);
        Fluttertoast.showToast(msg: 'Tạo thành công sản phẩm.');
      } else {
        Fluttertoast.showToast(msg: 'Tạo sản phẩm thất bại!');
      }
    }
  }
}
