import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

import '../../widgets/bt_skip_and_continue.dart';
import '../../widgets/product.dart';

class ChooseACategory extends StatelessWidget {
  const ChooseACategory({super.key});

  // chọn ngành hàng cho shop

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
                              color: AppColors.green_006200,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 4, left: 4),
                          height: AppDimens.dimens_5,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              color: AppColors.green_006200,
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
                                'Bạn đang kinh doanh ngành hàng nào?',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.dimens_30,
                        ),
                        Product(),
                        Product(),
                        Product(),
                        Product(),
                        Product(),
                        Product(),
                      ],
                    )
                  ],
                ),
              ),
              BtSkipAndContinue()
            ],
          ),
        ),
      ),
    );
  }
}
