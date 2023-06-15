import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/screens/manager/product/create_product.dart';
import 'package:sales_manager/screens/manager/product/product_manager.dart';
import 'package:sales_manager/widgets/header_center.dart';

import 'catalog_manager.dart';

class Menage extends StatelessWidget {
  const Menage({super.key});

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
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Quản lý'),
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
                      hintText: 'Tìm kiếm đơn hàng')),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
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
      ),
    );
  }
}
