import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

import '../../widgets/bt_continue.dart';
import '../../widgets/bt_skip_and_continue.dart';
import '../../widgets/item_demand.dart';

class Demand extends StatelessWidget {
  const Demand({super.key});

  // chọn nhu cầu sử dụng

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.85 - 60,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 4, left: 4),
                          height: AppDimens.dimens_5,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              color: AppColors.blue_028f76,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 4, left: 4),
                          height: AppDimens.dimens_5,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              color: AppColors.blue_028f76,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 4, left: 4),
                          height: AppDimens.dimens_5,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              color: AppColors.blue_028f76,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimens.dimens_30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Text(
                                'Nhu cầu của bạn khi sử dụng sổ bán hàng?',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_25,
                                    fontWeight: FontFamily.semiBold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.dimens_30,
                        ),
                        ItemDemand(),
                        ItemDemand(),
                        ItemDemand(),
                        ItemDemand(),
                      ],
                    ),
                    SizedBox(
                      height: AppDimens.dimens_20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'Bạn có mã giới thiệu? ',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Nhập mã ngay!',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_15,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              BtContinue()
            ],
          ),
        ),
      ),
    );
  }
}
