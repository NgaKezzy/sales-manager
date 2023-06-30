import 'package:flutter/material.dart';
import 'package:sales_manager/screens/manager/oder/oder.dart';

class Order {
  String idWarehouse;
  String purchaseDate;
  String funds;
  String customerName;
  String bill;
  String noteOrder;
  List listProduct;

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
      listProduct: json['listProduct'].toList(),
    );
  }

  static List<Order> convertToOrder(List<dynamic> json) {
    //json ở đây là data
    return json.map<Order>((order) => Order.fromJson(order)).toList();
    // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
