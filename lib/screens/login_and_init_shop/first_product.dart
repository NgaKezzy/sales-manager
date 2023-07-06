import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

import '../../config/app.font.dart';
import '../../widgets/bt_skip_and_complate.dart';
import '../../widgets/bt_skip_and_continue.dart';

class FirstProduct extends StatelessWidget {
  const FirstProduct({super.key});

  // Tạo ra sản phẩm đầu tiên

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                                  child: const Text(
                                    'Tuyệt vời giờ hãy tạo sản phầm đầu tiên của cửa hàng nhé!',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_25,
                                        fontWeight: FontFamily.semiBold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.dimens_40,
                            ),
                            Text('Tên sản phầm'),
                            const SizedBox(
                              height: AppDimens.dimens_40,
                              child: TextField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: InputDecoration(
                                  hintText: 'Ví dụ : Mì Hảo Hảo',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimens.dimens_30,
                            ),
                            Text('Giá bán'),
                            const SizedBox(
                              height: AppDimens.dimens_40,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0.000',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: AppDimens.dimens_30,
                            ),
                            Text('Giá vốn'),
                            const SizedBox(
                              height: AppDimens.dimens_40,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '0.000',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  BtSkipAndComplate()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
