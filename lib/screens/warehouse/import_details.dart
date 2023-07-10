import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/header_center.dart';

class ImportDetails extends StatelessWidget {
  const ImportDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          HeaderCenter(txt_header: 'Chi tiết nhập hàng'),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            color: AppColors.grey_8A8A8A.withOpacity(0.1),
            child: Column(
              children: [
                Container(
                  height: AppDimens.dimens_60,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#NH2',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontFamily.medium),
                          ),
                          Text('17:03  03/06/23')
                        ],
                      ),
                      Text(
                        'Đã thanh toán',
                        style: TextStyle(color: AppColors.blue_028f76),
                      )
                    ],
                  ),
                ),
                Container(
                  height: AppDimens.dimens_100,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sản phẩm ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontFamily.medium),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                height: AppDimens.dimens_50,
                                width: AppDimens.dimens_50,
                                decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chuột',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'SP0001',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.grey_8A8A8A),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '300.000 x 3',
                                style: TextStyle(color: AppColors.grey_8A8A8A),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '900.000',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontFamily.medium),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppDimens.dimens_30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tổng số lượng',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontFamily.medium),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tổng tiền hàng',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              '900.000',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontFamily.medium),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chiết khấu',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontFamily.medium),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chi phí phát sinh',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontFamily.medium),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.dimens_30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tổng cộng',
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              '900.000',
                              style: TextStyle(
                                  color: AppColors.red_FC0000,
                                  fontWeight: FontFamily.medium),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimens.dimens_20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red_FC0000),
                        onPressed: () {},
                        child: Text('Xóa')))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
