import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

import '../config/app.font.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: AppDimens.dimens_65,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey_8A8A8A),
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        SizedBox(
          width: AppDimens.dimens_20,
        ),
        SvgPicture.asset(
          'assets/svg/food.svg',
          height: AppDimens.dimens_30,
        ),
        SizedBox(
          width: AppDimens.dimens_10,
        ),
        Text(
          'Đồ ăn',
          style: TextStyle(
              fontSize: AppDimens.dimens_20, fontWeight: FontFamily.medium),
        )
      ]),
    );
  }
}
