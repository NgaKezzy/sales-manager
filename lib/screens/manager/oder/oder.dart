import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/oder/all.dart';
import 'package:sales_manager/screens/manager/oder/delivered.dart';
import 'package:sales_manager/screens/manager/oder/processing.dart';
import 'package:sales_manager/screens/manager/oder/returns.dart';

import '../../../config/app_color.dart';
import '../../../widgets/header_center.dart';
import '../../login_and_init_shop/controller/auth_controller.dart';
import '../controller/order_controller.dart';
import '../controller/products_controller.dart';
import '../create_oder/sell.dart';

class Oder extends StatefulWidget {
  const Oder({super.key});

  @override
  State<Oder> createState() => _OderState();
}

class _OderState extends State<Oder> {
  late ProductsController productsController;
  late AuthController authController;
  late OrderController orderController;
  @override
  void didChangeDependencies() {
    productsController = context.read<ProductsController>();
    orderController = context.read<OrderController>();
    authController = context.read<AuthController>();

    orderController.getListOrder();
    productsController.getDataProducts();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Sell()));
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            HeaderCenter(
              txt_header: 'Đơn hàng',
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 120,
                child: Column(
                  children: const [
                    TabBar(
                        isScrollable: true,
                        labelColor: AppColors.blue_028f76,
                        unselectedLabelColor: AppColors.black,
                        indicatorColor: AppColors.blue_028f76,
                        tabs: [
                          Tab(
                            text: 'Tất cả',
                          ),
                          Tab(
                            text: 'Đang xử lý',
                          ),
                          Tab(
                            text: 'Đã giao',
                          ),
                          Tab(
                            text: 'Trả hàng',
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(children: [
                        All(),
                        Processing(),
                        Delivered(),
                        returns(),
                      ]),
                    ),
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
