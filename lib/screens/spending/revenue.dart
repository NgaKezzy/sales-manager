import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../widgets/header_center.dart';

class Revenue extends StatefulWidget {
  const Revenue({super.key});

  @override
  State<Revenue> createState() => _RevenueState();
}

class _RevenueState extends State<Revenue> {
  @override
  Widget build(BuildContext context) {
    SpendingController spendingController = context.read<SpendingController>();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCenter(txt_header: 'Khoản thu'),
            InkWell(
              onTap: () => spendingController.setDateTimeRevenue(context),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: AppColors.grey_8A8A8A.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_month,
                        color: AppColors.blue_0000ff.withOpacity(0.8)),
                    SizedBox(
                      width: AppDimens.dimens_20,
                    ),
                    Text(
                      spendingController.dateRevenue.split(' ')[0],
                      style: TextStyle(
                          fontSize: AppDimens.dimens_20,
                          color: AppColors.blue_0000ff.withOpacity(0.8),
                          fontWeight: FontFamily.semiBold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nhập số tiền',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamily.medium,
                        color: AppColors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: spendingController.revenueMoneyController,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontFamily.semiBold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: AppColors.grey_808080
                                .withOpacity(0.6)), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: AppColors.grey_808080), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: AppColors.red_FF5151), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: AppColors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguồn tiền',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamily.medium,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.dimens_20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            spendingController.revenueFund = 'Tiền mặt';
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: spendingController.revenueFund ==
                                          'Tiền mặt'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Tiền mặt',
                              style: TextStyle(
                                color:
                                    spendingController.revenueFund == 'Tiền mặt'
                                        ? AppColors.blue_0000ff
                                        : AppColors.grey_8A8A8A,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            spendingController.revenueFund = 'Ví điện tử';
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: spendingController.revenueFund ==
                                          'Ví điện tử'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Ví điện tử',
                              style: TextStyle(
                                  color: spendingController.revenueFund ==
                                          'Ví điện tử'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            spendingController.revenueFund = 'Ngân hàng';
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: spendingController.revenueFund ==
                                          'Ngân hàng'
                                      ? AppColors.blue_0000ff
                                      : AppColors.grey_8A8A8A,
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Ngân hàng',
                              style: TextStyle(
                                color: spendingController.revenueFund ==
                                        'Ngân hàng'
                                    ? AppColors.blue_0000ff
                                    : AppColors.grey_8A8A8A,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimens.dimens_30,
                    ),
                    Text(
                      'Ghi chú',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamily.medium,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: spendingController.revenueNoteController,
                      textInputAction: TextInputAction.done,
                      maxLines: 3,
                      autocorrect: true,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: AppColors.grey_808080
                                  .withOpacity(0.6)), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: AppColors.grey_808080), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: AppColors.red_FF5151), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.green_006200),
                                onPressed: () {
                                  spendingController.createRevenue();
                                },
                                child: Text('Tạo'))),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
