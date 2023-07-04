import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/models/data_app.dart';
import 'package:sales_manager/screens/login_and_init_shop/controller/auth_controller.dart';
import 'package:sales_manager/screens/login_and_init_shop/login.dart';
import 'package:sales_manager/screens/login_and_init_shop/register.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';
import 'package:sales_manager/screens/manager/oder/all.dart';
import 'package:sales_manager/screens/manager/create_oder/order_confirmation.dart';
import 'package:sales_manager/screens/manager/product/manage.dart';
import 'package:sales_manager/screens/manager/oder/oder.dart';
import 'package:sales_manager/screens/manager/create_oder/sell.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/screens/manager/report/report.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';
import 'package:sales_manager/screens/spending/expenses.dart';
import 'package:sales_manager/screens/spending/spending_screen.dart';
import 'package:sales_manager/screens/warehouse/product_details.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_and_init_shop/chsose_a_category.dart';
import 'screens/login_and_init_shop/create_shop.dart';
import 'screens/login_and_init_shop/demand.dart';
import 'screens/login_and_init_shop/first_product.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataApp(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsController(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SpendingController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    context.read<AuthController>().checkLogin();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = context.watch<AuthController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: authController.isLogin ? HomeScreen() : Login(),
    );
  }
}
