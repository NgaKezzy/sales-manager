import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/header_center.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCenter(txt_header: 'Khoản chi'),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: AppColors.grey_8A8A8A,
              child: Text('Thêm lịch vào'),
            ),
            Container(
              height: AppDimens.dimens_90,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nhập số tiền',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamily.medium,
                        color: AppColors.green_55b135),
                  ),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      maxLines: 1,
                      maxLength: 15,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontFamily.semiBold),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          //<-- SEE HERE
                          borderSide: BorderSide(
                              width: 1, color: AppColors.green_55b135),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguồn tiền',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamily.medium,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                            style: TextStyle(color: AppColors.blue_0000ff),
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
                            style: TextStyle(color: AppColors.grey_8A8A8A),
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
                            style: TextStyle(color: AppColors.grey_8A8A8A),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ghi chú',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontFamily.medium,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.red_d31900),
                                onPressed: () {},
                                child: Text('Tạo'))),
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
