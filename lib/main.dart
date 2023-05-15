import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sales_manager/screens/login_and_init_shop/login_screen.dart';
import 'package:sales_manager/screens/manager/manage.dart';
import 'package:sales_manager/screens/manager/oder.dart';
import 'package:sales_manager/screens/manager/order_confirmation.dart';
import 'package:sales_manager/screens/manager/payment_confirmation.dart';
import 'package:sales_manager/screens/manager/sell.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_and_init_shop/chsose_a_category.dart';
import 'screens/login_and_init_shop/create_shop.dart';
import 'screens/login_and_init_shop/demand.dart';
import 'screens/login_and_init_shop/first_product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menage(),
    );
  }
}
