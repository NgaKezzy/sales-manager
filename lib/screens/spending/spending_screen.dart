import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';
import 'package:sales_manager/screens/spending/revenue.dart';
import 'package:sales_manager/screens/spending/revenue_and_expenditure_content.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../widgets/drawer_app.dart';
import 'expenses.dart';

class SpendingScreen extends StatefulWidget {
  const SpendingScreen({super.key});

  @override
  State<SpendingScreen> createState() => _SpendingScreenState();
}

class _SpendingScreenState extends State<SpendingScreen> {
  late PageController _controller;
  late SpendingController spendingController;
  int _index = 0;
  @override
  void initState() {
    _controller = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_028f76,
        title: Text('Tên shop'),
        // actions: [
        // Row(
        //   children: const [
        //     Icon(
        //       Icons.qr_code_scanner,
        //       color: Colors.white,
        //     ),
        //     SizedBox(
        //       width: AppDimens.dimens_20,
        //     ),
        //     Icon(
        //       Icons.messenger,
        //       color: Colors.white,
        //     ),
        //     SizedBox(
        //       width: 10,
        //     )
        //   ],
        // ),
        // ],
      ),
      drawer: DrawerApp(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: AppColors.grey_808080.withOpacity(0.1),
            // padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: AppDimens.dimens_60,
                  color: AppColors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppDimens.dimens_40,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: AppColors.grey_8A8A8A.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  _controller.animateToPage(
                                    0,
                                    curve: Curves.fastOutSlowIn,
                                    duration: Duration(milliseconds: 400),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  height: AppDimens.dimens_30,
                                  decoration: BoxDecoration(
                                    color: _index == 0
                                        ? AppColors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Hôm nay',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_13,
                                        color: _index == 0
                                            ? AppColors.blue_028f76
                                            : AppColors.black,
                                        fontWeight: FontFamily.medium),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _controller.animateToPage(
                                    1,
                                    curve: Curves.fastOutSlowIn,
                                    duration: Duration(milliseconds: 400),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  height: AppDimens.dimens_30,
                                  decoration: BoxDecoration(
                                    color: _index == 1
                                        ? AppColors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Tháng này',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_13,
                                        color: _index == 1
                                            ? AppColors.blue_028f76
                                            : AppColors.black,
                                        fontWeight: FontFamily.medium),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _controller.animateToPage(
                                    2,
                                    curve: Curves.fastOutSlowIn,
                                    duration: Duration(milliseconds: 400),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  height: AppDimens.dimens_30,
                                  decoration: BoxDecoration(
                                    color: _index == 2
                                        ? AppColors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Tháng trước',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_13,
                                        color: _index == 2
                                            ? AppColors.blue_028f76
                                            : AppColors.black,
                                        fontWeight: FontFamily.medium),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (index) => setState(() {
                      _index = index;
                    }),
                    children: [
                      RevenueAndExpenditureContent(),
                      RevenueAndExpenditureContent(),
                      RevenueAndExpenditureContent(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Container(
              color: AppColors.white,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
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
                              Icons.arrow_upward,
                              size: 20,
                            ),
                            Text(
                              'Khoản chi',
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
                                  builder: (context) => Revenue()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              size: 20,
                            ),
                            Text(
                              'Khoản thu',
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
