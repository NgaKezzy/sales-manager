import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sales_manager/screens/manager/report/warehouse.dart';
import 'package:sales_manager/screens/spending/revenue.dart';
import 'package:sales_manager/screens/warehouse/warehouse_products.dart';
import 'package:sales_manager/widgets/header_center.dart';
import 'package:sales_manager/widgets/header_center_no_back.dart';

import '../../config/app_color.dart';
import '../spending/expenses.dart';
import 'inventory_book.dart';

class WareHouseScreen extends StatelessWidget {
  const WareHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderCenterNoBack(txt_header: 'Kho hàng'),
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
                                  text: 'Sổ kho',
                                ),
                              ),
                            ]),
                        const Expanded(
                          child: TabBarView(children: [
                            WarehouseProducts(),
                            InventoryBook(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
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
                                  builder: (context) => Expenses()));
                        },
                        child: Row(
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
                            backgroundColor: AppColors.green_006200),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Revenue()));
                        },
                        child: Row(
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
    );
  }
}
