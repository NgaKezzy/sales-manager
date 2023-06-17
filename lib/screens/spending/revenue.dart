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
    return ChangeNotifierProvider(
      create: (context) => SpendingController(),
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCenter(txt_header: 'Khoản thu'),
              Consumer<SpendingController>(
                builder: (context, spendingController, child) {
                  return InkWell(
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
                  );
                },
              ),
              Container(
                height: AppDimens.dimens_90,
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
                          color: AppColors.green_55b135),
                    ),
                    TextField(
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontFamily.semiBold),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.green_55b135),
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
                          Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.blue_0000ff, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Tiền mặt',
                              style: TextStyle(color: AppColors.blue_0000ff),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.grey_8A8A8A, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Ví điện tử',
                              style: TextStyle(color: AppColors.grey_8A8A8A),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: AppDimens.dimens_100,
                            height: AppDimens.dimens_35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.grey_8A8A8A, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Ngân hàng',
                              style: TextStyle(color: AppColors.grey_8A8A8A),
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
                      TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                width: 1, color: AppColors.green_55b135),
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
                                  onPressed: () {},
                                  child: Text('Tạo'))),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
