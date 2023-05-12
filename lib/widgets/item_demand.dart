import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

import '../config/app.font.dart';

class ItemDemand extends StatelessWidget {
  const ItemDemand({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: AppDimens.dimens_55,
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey_8A8A8A),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: const [
          SizedBox(
            width: AppDimens.dimens_10,
          ),
          Text(
            'Nắm bắt doanh thu bán hàng',
            style: TextStyle(
                fontSize: AppDimens.dimens_16, fontWeight: FontFamily.semiBold),
          )
        ],
      ),
    );
  }
}
