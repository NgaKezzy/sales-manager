import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/screens/manager/oder/all.dart';
import 'package:sales_manager/screens/manager/oder/delivered.dart';
import 'package:sales_manager/screens/manager/oder/processing.dart';
import 'package:sales_manager/screens/manager/oder/returns.dart';

import '../../../config/app_color.dart';
import '../../../widgets/header_center.dart';

class Oder extends StatefulWidget {
  const Oder({super.key});

  @override
  State<Oder> createState() => _OderState();
}

class _OderState extends State<Oder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCenter(
              txt_header: 'Đơn hàng',
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: const TextField(
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
                length: 4,
                child: Column(
                  children: const [
                    TabBar(
                        isScrollable: true,
                        labelColor: AppColors.green_55b135,
                        unselectedLabelColor: AppColors.black,
                        indicatorColor: AppColors.green_55b135,
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
            )
          ],
        ),
      ),
    );
  }
}