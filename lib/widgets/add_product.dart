import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: AppColors.blue_028f76,
          ),
          Text(
            'Thêm sản phẩm',
            style: TextStyle(
                color: AppColors.blue_028f76,
                fontWeight: FontFamily.medium,
                fontSize: AppDimens.dimens_11),
          )
        ],
      ),
    );
  }
}
