import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/screens/login_and_init_shop/controller/auth_controller.dart';
import 'package:sales_manager/screens/manager/product/create_product.dart';
import 'package:sales_manager/screens/manager/controller/product_manager.dart';
import 'package:sales_manager/screens/manager/report/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import 'catalog_manager.dart';

class Menage extends StatefulWidget {
  const Menage({super.key});

  @override
  State<Menage> createState() => _MenageState();
}

class _MenageState extends State<Menage> {
  late ProductsController productsController;
  late AuthController authController;
  @override
  void didChangeDependencies() {
    authController = context.read<AuthController>();
    productsController = context.read<ProductsController>();
    productsController
        .getdataProducts(authController.userLogin?.idWarehouse ?? '');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateProduct(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Quản lý'),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                child: const TextField(
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: AppColors.green_55b135,
                    textAlignVertical: TextAlignVertical(y: 0.9),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.green_55b135, width: 1)),
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppColors.green_55b135,
                        ),
                        hintText: 'Tìm kiếm sản phẩm')),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 120,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                          isScrollable: true,
                          labelColor: AppColors.green_55b135,
                          unselectedLabelColor: AppColors.black,
                          indicatorColor: AppColors.green_55b135,
                          tabs: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.41,
                              child: Tab(
                                text: 'Sản phẩm',
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.41,
                              child: Tab(
                                text: 'Danh mục',
                              ),
                            ),
                          ]),
                      const Expanded(
                        child: TabBarView(children: [
                          ProductManager(),
                          CatalogManager(),
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
