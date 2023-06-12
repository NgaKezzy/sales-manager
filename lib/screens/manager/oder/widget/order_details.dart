import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/header_center.dart';

class OderDetail extends StatelessWidget {
  const OderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Chi tiết đơn hàng'),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.dimens_10,
                  vertical: AppDimens.dimens_10),
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YYVHIU',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontFamily.medium),
                      ),
                      Text('18:15 - 05/06/23')
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '300.0000',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontFamily.medium),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: AppColors.white,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: AppDimens.dimens_30,
                    backgroundImage: AssetImage('assets/img/ngoc.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Khách lẻ',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontFamily.medium),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    width: AppDimens.dimens_70,
                    height: AppDimens.dimens_60,
                    color: AppColors.blue_028f76,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chuột logi',
                        style: TextStyle(fontWeight: FontFamily.medium),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SL: 1',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            '300.000',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tổng 1 sản phẩm'),
                        Text(
                          '300.000',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phí vận chuyển'),
                        Text('300.000'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Chiết khấu'),
                        Text('300.000'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng cộng',
                          style: TextStyle(
                              fontWeight: FontFamily.medium, fontSize: 18),
                        ),
                        Text(
                          '300.000',
                          style: TextStyle(
                              color: AppColors.red_FF5151,
                              fontWeight: FontFamily.medium,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red_FC0000),
                    onPressed: () {},
                    child: Text("Xóa đơn hàng")))
          ],
        ),
      ),
    );
  }
}
