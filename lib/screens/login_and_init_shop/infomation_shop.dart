import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/header_center.dart';

class InofmationShop extends StatelessWidget {
  const InofmationShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Thông tin cửa hàng'),
          Container(
            margin: EdgeInsets.only(top: AppDimens.dimens_10),
            padding: EdgeInsets.all(10),
            color: AppColors.white,
            height: MediaQuery.of(context).size.height - 90,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tên cửa hàng',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_16,
                        fontWeight: FontFamily.medium,
                        color: AppColors.grey_808080),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.dimens_40,
                  ),
                  Text(
                    'Số điện thoại',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_16,
                        fontWeight: FontFamily.medium,
                        color: AppColors.grey_808080),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: '0912345467',
                        hintStyle: TextStyle(
                            fontSize: AppDimens.dimens_14,
                            color: AppColors.grey_8A8A8A)),
                  ),
                  SizedBox(
                    height: AppDimens.dimens_40,
                  ),
                  Text(
                    'Địa chỉ',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_16,
                        fontWeight: FontFamily.medium,
                        color: AppColors.grey_808080),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Nhập địa chỉ',
                        hintStyle: TextStyle(
                            fontSize: AppDimens.dimens_14,
                            color: AppColors.grey_8A8A8A)),
                  ),
                  SizedBox(
                    height: AppDimens.dimens_40,
                  ),
                  Text(
                    'Mô tả cửa hàng',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_16,
                        fontWeight: FontFamily.medium,
                        color: AppColors.grey_808080),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Ví dụ: Chuyên bán các mặt hàng gia dụng',
                        hintStyle: TextStyle(
                            fontSize: AppDimens.dimens_14,
                            color: AppColors.grey_8A8A8A)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: EdgeInsets.only(top: AppDimens.dimens_40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green_006200),
                          onPressed: () {},
                          child: Text('Cập nhật'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
