import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/report/profit_and_loss.dart';
import 'package:sales_manager/screens/manager/report/revenue_and_expenditure.dart';
import 'package:sales_manager/screens/manager/report/warehouse.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../../config/app_color.dart';
import '../controller/statistical_controller.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late StatisticalController statisticalController;
  void didChangeDependencies() {
    statisticalController = context.read<StatisticalController>();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Báo cáo'),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 80,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                          physics: const NeverScrollableScrollPhysics(),
                          isScrollable: true,
                          labelColor: AppColors.blue_028f76,
                          unselectedLabelColor: AppColors.black,
                          indicatorColor: AppColors.blue_028f76,
                          tabs: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Tab(
                                text: 'Lãi lỗ',
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Tab(
                                text: 'Kho hàng',
                              ),
                            ),
                          ]),
                      Expanded(
                        child: TabBarView(children: [
                          ProfitAndLoss(),
                          Warehouse(),
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
