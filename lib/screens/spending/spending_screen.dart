import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sales_manager/screens/spending/revenue.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../widgets/drawer_app.dart';
import 'expenses.dart';

class SpendingScreen extends StatelessWidget {
  const SpendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_006200,
        title: Text('Tên shop'),
        actions: [
          Row(
            children: const [
              Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
              SizedBox(
                width: AppDimens.dimens_20,
              ),
              Icon(
                Icons.messenger,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
      drawer: DrawerApp(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: AppColors.grey_8A8A8A.withOpacity(0.2),
            // padding: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
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
                            height: AppDimens.dimens_50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: AppColors.grey_8A8A8A.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  height: AppDimens.dimens_40,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Hôm nay',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_13,
                                        color: AppColors.green_55b135,
                                        fontWeight: FontFamily.medium),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  height: AppDimens.dimens_40,
                                  decoration: BoxDecoration(
                                    color: AppColors.green_7ab317,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Tháng này',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_13,
                                        color: AppColors.black,
                                        fontWeight: FontFamily.medium),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  height: AppDimens.dimens_40,
                                  decoration: BoxDecoration(
                                    color: AppColors.red_FF5151,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Tháng trước',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_13,
                                        color: AppColors.black,
                                        fontWeight: FontFamily.medium),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Số dư : ',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_16,
                                  fontWeight: FontFamily.medium),
                            ),
                            Text(
                              '61.524.000',
                              style: TextStyle(
                                  color: AppColors.green_55b135,
                                  fontSize: AppDimens.dimens_16,
                                  fontWeight: FontFamily.medium),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: AppDimens.dimens_60,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.grey_8A8A8A.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Tổng chi',
                                      style: TextStyle(
                                          color: AppColors.grey_8A8A8A,
                                          fontSize: AppDimens.dimens_16),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1.250.000 ',
                                          style: TextStyle(
                                              color: AppColors.red_FC0000,
                                              fontWeight: FontFamily.semiBold,
                                              fontSize: AppDimens.dimens_16),
                                        ),
                                        Text(
                                          ' đ',
                                          style: TextStyle(
                                              color: AppColors.red_FC0000,
                                              fontWeight: FontFamily.semiBold,
                                              fontSize: AppDimens.dimens_16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: AppDimens.dimens_60,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.grey_8A8A8A.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Tổng thu',
                                      style: TextStyle(
                                          color: AppColors.grey_8A8A8A,
                                          fontSize: AppDimens.dimens_16),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1.250.000 ',
                                          style: TextStyle(
                                              color: AppColors.green_55b135,
                                              fontWeight: FontFamily.semiBold,
                                              fontSize: AppDimens.dimens_16),
                                        ),
                                        Text(
                                          ' đ',
                                          style: TextStyle(
                                              color: AppColors.green_55b135,
                                              fontWeight: FontFamily.semiBold,
                                              fontSize: AppDimens.dimens_16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  DayTrading(),
                  SizedBox(
                    height: AppDimens.dimens_60,
                  )
                ],
              ),
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

class DayTrading extends StatelessWidget {
  const DayTrading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1, color: AppColors.grey_8A8A8A.withOpacity(0.3)))),
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: AppColors.grey_8A8A8A.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                '19',
                style: TextStyle(fontWeight: FontFamily.medium),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thứ sáu',
                  style: TextStyle(fontSize: 16, fontWeight: FontFamily.medium),
                ),
                Text(
                  'Tháng 5/23',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontFamily.light,
                      color: AppColors.grey_8A8A8A),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Text(
              '1.250.000',
              style: TextStyle(
                  color: AppColors.green_55b135,
                  fontSize: 18,
                  fontWeight: FontFamily.semiBold),
            )
          ],
        ),
      ),
    );
  }
}
