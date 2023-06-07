import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';

class CreateImportGoods extends StatelessWidget {
  const CreateImportGoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.grey_8A8A8A.withOpacity(0.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                HeaderCenter(txt_header: 'Tạo nhập hàng'),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green_006200),
                              onPressed: () {},
                              child: Text('Thanh toán'),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              color: AppColors.white,
                              child: Column(
                                children: [
                                  SelectedItem(),
                                  SelectedItem(),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: AppDimens.dimens_10, bottom: 10),
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.green_006200,
                                        ),
                                        Text(
                                          'Thêm sản phẩm',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontFamily.medium,
                                              color: AppColors.green_006200),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tổng số lượng',
                                              style: TextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight:
                                                      FontFamily.medium),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimens.dimens_30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tổng tiền hàng',
                                              style: TextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            Text(
                                              '900.000',
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight:
                                                      FontFamily.medium),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimens.dimens_30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Chiết khấu',
                                              style: TextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight:
                                                      FontFamily.medium),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimens.dimens_30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Chi phí phát sinh',
                                              style: TextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  color: AppColors.black,
                                                  fontWeight:
                                                      FontFamily.medium),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimens.dimens_30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tổng cộng',
                                              style: TextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                            Text(
                                              '900.000',
                                              style: TextStyle(
                                                  color: AppColors.red_FC0000,
                                                  fontWeight:
                                                      FontFamily.medium),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        color: AppColors.white,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: TextField(
                                          maxLines: 3,
                                          keyboardType: TextInputType.multiline,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Ghi chú',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      height: AppDimens.dimens_100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: AppColors.grey_8A8A8A.withOpacity(0.5), width: 1)),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: AppDimens.dimens_60,
            width: AppDimens.dimens_60,
            decoration: BoxDecoration(
                color: AppColors.pink_FA4881,
                borderRadius: BorderRadius.circular(5)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tai nghe',
                style: TextStyle(fontSize: 15, fontWeight: FontFamily.medium),
              ),
              Text(
                'SP00011',
                style: TextStyle(color: AppColors.grey_8A8A8A),
              )
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Giá: 180.000 x 100'),
              Text(
                '18.000.000',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.red_FC0000,
                    fontWeight: FontFamily.medium),
              ),
            ],
          )
        ],
      ),
    );
  }
}
