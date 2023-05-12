import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';

class HeaderCenter extends StatelessWidget {
  HeaderCenter({required String this.txt_header, super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.arrow_back_ios),
          Text(
            txt_header,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontFamily.medium,
            ),
          ),
          SizedBox()
        ],
      ),
    );
  }
}
