import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app_size.dart';

import '../config/app_color.dart';

class BtSkipAndContinue extends StatelessWidget {
  const BtSkipAndContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: 55,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              'Bỏ qua',
              style: TextStyle(color: AppColors.black),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: AppDimens.dimens_55,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: AppColors.blue_028f76),
            child: Text('Tiếp tục'),
          ),
        ),
      ]),
    );
  }
}
