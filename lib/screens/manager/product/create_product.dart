import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/header_center.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 20,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderCenter(txt_header: 'Tạo sản phẩm'),
                  Container(
                    height: AppDimens.dimens_120,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.grey_8A8A8A.withOpacity(0.1),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: AppDimens.dimens_90,
                          width: AppDimens.dimens_90,
                          color: AppColors.blue_028f76,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tên sản phẩm ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontFamily.medium),
                        ),
                        SizedBox(height: 30, child: TextField()),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(children: [
                                Text(
                                  'Giá bán',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontFamily.medium,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                SizedBox(height: 30, child: TextField()),
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(children: [
                                Text(
                                  'Giá vốn',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontFamily.medium,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                SizedBox(height: 30, child: TextField()),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(children: [
                                Text(
                                  'Tồn kho',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontFamily.medium,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                SizedBox(height: 30, child: TextField()),
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(children: [
                                Text(
                                  'Mã sản phẩm',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontFamily.medium,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                SizedBox(height: 30, child: TextField()),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green_006200),
                      onPressed: () {},
                      child: Text('Xác nhận'))))
        ],
      ),
    );
  }
}
