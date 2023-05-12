import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/app_color.dart';
import '../config/app_size.dart';

class Buttom_2 extends StatelessWidget {
  Buttom_2({required this.txt_left, required this.txt_rightt, super.key});

  final String txt_left;
  final String txt_rightt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 10, bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: 55,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              txt_left,
              style: TextStyle(color: AppColors.black),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: AppDimens.dimens_55,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: AppColors.green_55b135),
            child: Text(txt_rightt),
          ),
        ),
      ]),
    );
  }
}
