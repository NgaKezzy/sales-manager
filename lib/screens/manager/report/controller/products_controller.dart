import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sales_manager/models/product_model.dart';
import 'package:sales_manager/network/fetch_api.dart';

class ProductsController extends ChangeNotifier {
  List resultProducts = [];
  bool isLoading = false;
  void getdataProducts(String idWarehouse) async {
    final dataProducts = await NetworkApi.getProdcut(idWarehouse);

    final List<Product> product =
        Product.convertToProduct(dataProducts['data']);
    resultProducts = product;
    isLoading = true;
    notifyListeners();
  }
}
