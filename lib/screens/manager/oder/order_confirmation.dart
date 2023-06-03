
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/buttom_2.dart';

import '../../../config/app.font.dart';
import '../../../widgets/bt_skip_and_continue.dart';
import '../../../widgets/header_center.dart';
import '../../../widgets/passenger.dart';
import '../../../widgets/product_is_purcharsed.dart';

class OrderConfirmation extends StatelessWidget {
  OrderConfirmation({super.key});

  bool outstanding = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Xác nhận đơn hàng'),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        height: AppDimens.dimens_60,
                        color: AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: AppDimens.dimens_35,
                              width: AppDimens.dimens_150,
                              decoration: BoxDecoration(
                                  color: AppColors.grey_8A8A8A,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        outstanding = true;
                                        print("outstanding = " +
                                            outstanding.toString());
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: AppDimens.dimens_30,
                                        width: AppDimens.dimens_60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: outstanding == true
                                              ? AppColors.white
                                              : AppColors.grey_8A8A8A,
                                        ),
                                        child: const Text(
                                          'Giá bán',
                                          style: TextStyle(
                                              color: AppColors.green_55b135,
                                              fontSize: AppDimens.dimens_13,
                                              fontWeight: FontFamily.medium),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppDimens.dimens_5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        outstanding = false;
                                        print("outstanding = " +
                                            outstanding.toString());
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: AppDimens.dimens_30,
                                        width: AppDimens.dimens_60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: outstanding == false
                                              ? AppColors.white
                                              : AppColors.grey_8A8A8A,
                                        ),
                                        child: const Text(
                                          'Giá sỉ',
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 13,
                                              fontWeight: FontFamily.medium),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            const Text(
                              '+ Thêm sản phầm',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_15,
                                  color: AppColors.blue_0000ff),
                            )
                          ],
                        ),
                      ),
                      ProductIsPurcharsed(),
                      Passenger(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 230,
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Khuyễn mãi',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: AppDimens.dimens_120,
                                  height: AppDimens.dimens_30,
                                  decoration: BoxDecoration(
                                      color: AppColors.green_55b135
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    'Chọn khuyễn mãi',
                                    style: TextStyle(
                                        color: AppColors.green_55b135,
                                        fontSize: AppDimens.dimens_13),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Tổng 2 sản phẩm',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                Text(
                                  '1.200.000',
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: AppDimens.dimens_13,
                                      fontWeight: FontFamily.medium),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Phí vận chuyển',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.grey_8A8A8A,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '0.000',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: AppDimens.dimens_13,
                                          fontWeight: FontFamily.medium),
                                    ),
                                    Icon(
                                      Icons.border_color,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Chiết khấu',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.grey_8A8A8A,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '0.000',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: AppDimens.dimens_13,
                                          fontWeight: FontFamily.medium),
                                    ),
                                    Icon(
                                      Icons.border_color,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Tổng cộng',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.black,
                                      fontWeight: FontFamily.medium),
                                ),
                                Text(
                                  '1.200.000',
                                  style: TextStyle(
                                      color: AppColors.red_FC0000,
                                      fontSize: AppDimens.dimens_13,
                                      fontWeight: FontFamily.medium),
                                )
                              ],
                            ),
                            OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: AppColors.blue_0000ff,
                                        width: 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.account_balance_wallet,
                                      color: AppColors.blue_0000ff,
                                    ),
                                    Text(
                                      'Thanh toán trước',
                                      style: TextStyle(
                                          color: AppColors.blue_0000ff),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        height: AppDimens.dimens_70,
                        color: AppColors.white,
                        child: SizedBox(
                          height: AppDimens.dimens_40,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ghi chú khách hàng',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.grey_8A8A8A.withOpacity(0.3),
                        child: Text(
                          'Thêm lịch vào',
                          style: TextStyle(
                              color: AppColors.red_FC0000, fontSize: 20),
                        ),
                      ),
                      Buttom_2(txt_left: 'Giao sau', txt_rightt: 'Bán nhanh')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
