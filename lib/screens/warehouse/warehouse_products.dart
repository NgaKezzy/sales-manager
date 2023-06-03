import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/warehouse/product_details.dart';

import '../spending/expenses.dart';
import '../spending/revenue.dart';

class WarehouseProducts extends StatelessWidget {
  const WarehouseProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_8A8A8A.withOpacity(0.1),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: AppDimens.dimens_120,
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1 mã sản phẩm',
                      style: TextStyle(fontWeight: FontFamily.medium),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: AppDimens.dimens_70,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              color: AppColors.grey_8A8A8A.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    size: 18,
                                    color: AppColors.green_55b135,
                                  ),
                                  Text('Giá trị tồn')
                                ],
                              ),
                              Text(
                                '4.555.000',
                                style: TextStyle(
                                    color: AppColors.green_55b135,
                                    fontWeight: FontFamily.semiBold,
                                    fontSize: AppDimens.dimens_16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          height: AppDimens.dimens_70,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              color: AppColors.grey_8A8A8A.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.token,
                                    size: 18,
                                    color: AppColors.green_55b135,
                                  ),
                                  Text(' Số lượng')
                                ],
                              ),
                              Text(
                                '15',
                                style: TextStyle(
                                    color: AppColors.green_55b135,
                                    fontWeight: FontFamily.semiBold,
                                    fontSize: AppDimens.dimens_16),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
            ),
            ItemWareHouseProduct(),
            ItemWareHouseProduct(),
            ItemWareHouseProduct(),
            ItemWareHouseProduct(),
            ItemWareHouseProduct(),
            ItemWareHouseProduct(),
            ItemWareHouseProduct(),
            ItemWareHouseProduct(),
          ],
        ),
      ),
    );
  }
}

class ItemWareHouseProduct extends StatelessWidget {
  const ItemWareHouseProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColors.red_FC0000,
                  borderRadius: BorderRadius.circular(5)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Chuột",
                  style: TextStyle(
                      fontSize: AppDimens.dimens_14, color: AppColors.black),
                ),
                Text(
                  "SP0001",
                  style: TextStyle(
                      fontSize: AppDimens.dimens_14,
                      color: AppColors.grey_8A8A8A),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Tồn kho : 15",
                  style: TextStyle(
                      fontSize: AppDimens.dimens_14, color: AppColors.black),
                ),
                Text(
                  "45.000.000 đ",
                  style: TextStyle(
                      fontSize: AppDimens.dimens_14,
                      color: AppColors.red_FF5151),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
