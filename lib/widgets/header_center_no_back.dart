import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

class HeaderCenterNoBack extends StatelessWidget {
  const HeaderCenterNoBack({required this.txt_header, super.key});

  final String txt_header;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              txt_header,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.black,
                fontWeight: FontFamily.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
