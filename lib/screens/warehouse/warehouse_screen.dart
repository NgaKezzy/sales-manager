import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/report/warehouse.dart';
import 'package:sales_manager/screens/spending/revenue.dart';
import 'package:sales_manager/screens/warehouse/warehouse_products.dart';
import 'package:sales_manager/widgets/header_center.dart';
import 'package:sales_manager/widgets/header_center_no_back.dart';

import '../../config/app_color.dart';
import '../../widgets/drawer_app.dart';
import '../login_and_init_shop/controller/auth_controller.dart';
import '../manager/controller/products_controller.dart';
import '../spending/expenses.dart';
import 'create_corrections.dart';
import 'inventory_book.dart';
import 'more_goods.dart';

class WareHouseScreen extends StatefulWidget {
  const WareHouseScreen({super.key});

  @override
  State<WareHouseScreen> createState() => _WareHouseScreenState();
}

class _WareHouseScreenState extends State<WareHouseScreen> {
  late ProductsController productsController;
  late AuthController authController;
  @override
  void didChangeDependencies() {
    authController = context.read<AuthController>();
    productsController = context.read<ProductsController>();
    productsController
        .getDataProducts(authController.userLogin?.idWarehouse ?? '');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_028f76,
        title: authController.userLogin != null
            ? Text(authController.userLogin!.shopName)
            : Text('Tên shop'),
      ),
      drawer: DrawerApp(context),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(child: WarehouseProducts()),
              ],
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                color: AppColors.white,
                height: 50,
                // color: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.red_FF5151),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateCorrections()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                size: 20,
                              ),
                              Text(
                                'Chỉnh giảm',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue_028f76),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreGoods()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                size: 20,
                              ),
                              Text(
                                'Nhập hàng',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
