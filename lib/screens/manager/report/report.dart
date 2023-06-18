import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sales_manager/screens/manager/report/profit_and_loss.dart';
import 'package:sales_manager/screens/manager/report/revenue_and_expenditure.dart';
import 'package:sales_manager/screens/manager/report/warehouse.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../../config/app_color.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Báo cáo'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          TabBar(
                              physics: const NeverScrollableScrollPhysics(),
                              isScrollable: true,
                              labelColor: AppColors.green_55b135,
                              unselectedLabelColor: AppColors.black,
                              indicatorColor: AppColors.green_55b135,
                              tabs: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  child: Tab(
                                    text: 'Lãi lỗ',
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  child: Tab(
                                    text: 'Kho hàng',
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.24,
                                  child: Tab(
                                    text: 'Thu chi',
                                  ),
                                ),
                              ]),
                          Expanded(
                            child: TabBarView(children: [
                              ProfitAndLoss(),
                              Warehouse(),
                              RevenueAndExpenditure(),
                            ]),
                          ),
                        ],
                      ),
                    ),
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
