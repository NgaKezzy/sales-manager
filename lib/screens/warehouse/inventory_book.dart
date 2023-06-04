import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';

import 'import_details.dart';

class InventoryBook extends StatelessWidget {
  const InventoryBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_8A8A8A.withOpacity(0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: AppDimens.dimens_120,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                      ),
                      Text(
                        ' Tất cả',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontFamily.medium),
                      ),
                      Icon(Icons.expand_more)
                    ],
                  ),
                  Divider(
                    color: AppColors.grey_8A8A8A,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: AppDimens.dimens_70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Xuất hàng',
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.grey_8A8A8A),
                              ),
                              Text(
                                '4.500.000 đ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.green_55b135,
                                    fontWeight: FontFamily.semiBold),
                              ),
                            ],
                          )),
                      Container(
                        height: AppDimens.dimens_70,
                        width: 1,
                        color: AppColors.grey_8A8A8A,
                      ),
                      Container(
                          height: AppDimens.dimens_70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Nhập hàng',
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.grey_8A8A8A),
                              ),
                              Text(
                                '4.500.000 đ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.red_FC0000,
                                    fontWeight: FontFamily.semiBold),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_10),
              height: AppDimens.dimens_40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: AppColors.grey_8A8A8A.withOpacity(0.3),
                  width: 1,
                ),
              )),
              // color: AppColors.green_006200,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.4,
                    // color: AppColors.green_006200,
                    height: AppDimens.dimens_40,

                    child: Text(
                      'Tất cả',
                      style:
                          TextStyle(fontSize: 13, color: AppColors.grey_8A8A8A),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.27,
                    // color: AppColors.red_FC0000,
                    height: AppDimens.dimens_40,
                    child: Text(
                      'Xuất hàng',
                      style:
                          TextStyle(fontSize: 13, color: AppColors.grey_8A8A8A),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.27,
                    // color: AppColors.blue_0000ff,
                    height: AppDimens.dimens_40,
                    child: Text(
                      'Nhập hàng',
                      style:
                          TextStyle(fontSize: 13, color: AppColors.grey_8A8A8A),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_10),
              height: AppDimens.dimens_60,
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.4,
                    // color: AppColors.green_006200,
                    height: AppDimens.dimens_60,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hôm nay',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontFamily.medium),
                        ),
                        Text(
                          '7 giao dịch',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.grey_8A8A8A),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.27,
                    // color: AppColors.red_FC0000,
                    height: AppDimens.dimens_60,
                    child: Text(
                      '4.555.222',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.green_55b135,
                        fontWeight: FontFamily.semiBold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.27,
                    // color: AppColors.blue_0000ff,
                    height: AppDimens.dimens_60,
                    child: Text(
                      '8.444.111',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.red_FC0000,
                        fontWeight: FontFamily.semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.dimens_10,
              ),
              child: Column(
                children: [
                  ProductDelivery(),
                  ImportGoods(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImportGoods extends StatelessWidget {
  const ImportGoods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ImportDetails()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppDimens.dimens_5),
        height: AppDimens.dimens_90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: AppColors.white),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.4,
              height: AppDimens.dimens_90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '18:30',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_13,
                        color: AppColors.grey_8A8A8A),
                  ),
                  Text(
                    'Nhập hàng',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_13,
                        color: AppColors.grey_8A8A8A),
                  ),
                  Text(
                    'Đơn NH2',
                    style: TextStyle(
                      fontSize: AppDimens.dimens_15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              padding: EdgeInsets.only(right: AppDimens.dimens_10),
              color: AppColors.grey_8A8A8A.withOpacity(0.2),
              // alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.27,
              height: AppDimens.dimens_90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '300.000',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_15,
                        color: AppColors.red_FC0000,
                        fontWeight: FontFamily.medium),
                  ),
                  Text(
                    'SL: 1',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDelivery extends StatelessWidget {
  const ProductDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppDimens.dimens_5),
      height: AppDimens.dimens_90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.white),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.4,
            height: AppDimens.dimens_90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '18:30',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_13,
                      color: AppColors.grey_8A8A8A),
                ),
                Text(
                  'Bán hàng',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_13,
                      color: AppColors.grey_8A8A8A),
                ),
                Text(
                  'Đơn XH2',
                  style: TextStyle(
                    fontSize: AppDimens.dimens_15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: AppDimens.dimens_10),
            color: AppColors.grey_8A8A8A.withOpacity(0.2),
            // alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.27,
            height: AppDimens.dimens_90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '300.000',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_15,
                      color: AppColors.green_55b135,
                      fontWeight: FontFamily.medium),
                ),
                Text(
                  'SL: 1',
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
