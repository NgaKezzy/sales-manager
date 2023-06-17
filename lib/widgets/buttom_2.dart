import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../config/app.font.dart';
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
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      // <-- SEE HERE
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimens.dimens_24,
                              ),
                              Text(
                                'Xác nhận thanh toán',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_16,
                                    color: AppColors.black,
                                    fontWeight: FontFamily.medium),
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 24,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '300.000',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_25,
                                    color: AppColors.red_FC0000,
                                    fontWeight: FontFamily.medium),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppDimens.dimens_20,
                          ),
                          Text('Khách trả'),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            height: AppDimens.dimens_30,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: '300.000'),
                            ),
                          ),
                          Text('Nguồn tiền'),
                          SizedBox(
                            height: AppDimens.dimens_10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: AppDimens.dimens_100,
                                height: AppDimens.dimens_35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.blue_0000ff, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Tiền mặt',
                                  style:
                                      TextStyle(color: AppColors.blue_0000ff),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: AppDimens.dimens_100,
                                height: AppDimens.dimens_35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grey_8A8A8A, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Ví điện tử',
                                  style:
                                      TextStyle(color: AppColors.grey_8A8A8A),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: AppDimens.dimens_100,
                                height: AppDimens.dimens_35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grey_8A8A8A, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Ngân hàng',
                                  style:
                                      TextStyle(color: AppColors.grey_8A8A8A),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppDimens.dimens_10,
                          ),
                          Text(
                            'Nhận tiền đối soát tự động',
                          ),
                          SizedBox(
                            height: AppDimens.dimens_10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: AppDimens.dimens_80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.grey_8A8A8A, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/img/visa.png'),
                                        height: AppDimens.dimens_40,
                                      ),
                                      Text(
                                        'Link thanh toán',
                                        style: TextStyle(),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: AppDimens.dimens_80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.grey_8A8A8A, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/img/momo.png'),
                                        height: AppDimens.dimens_30,
                                      ),
                                      Text(
                                        'QR thanh toán',
                                        style: TextStyle(),
                                      )
                                    ]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppDimens.dimens_20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: AppDimens.dimens_55,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.green_55b135),
                                onPressed: () {},
                                child: Text(
                                  'Xác nhận',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_16,
                                      fontWeight: FontFamily.medium),
                                )),
                          )
                        ],
                      ),
                    );
                  });
            },
            style: ElevatedButton.styleFrom(primary: AppColors.green_006200),
            child: Text(txt_rightt),
          ),
        ),
      ]),
    );
  }
}
