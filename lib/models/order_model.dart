import 'package:flutter/material.dart';
import 'package:sales_manager/screens/manager/oder/oder.dart';

class Order {
  String idWarehouse;
  String purchaseDate;
  String funds;
  String customerName;
  String bill;
  String noteOrder;
  Map listProduct;

  Order(
      {required this.idWarehouse,
      required this.purchaseDate,
      required this.funds,
      required this.customerName,
      required this.bill,
      required this.noteOrder,
      required this.listProduct});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      idWarehouse: json['idWarehouse'],
      purchaseDate: json["purchaseDate"],
      funds: json['funds'],
      customerName: json['customerName'],
      bill: json['bill'],
      noteOrder: json['noteOrder'],
      listProduct: json['listProduct'],
    );
  }
}
