import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';
import 'package:sales_manager/widgets/buttom_2.dart';

import '../../../config/app.font.dart';
import '../../../widgets/bt_skip_and_continue.dart';
import '../../../widgets/header_center.dart';
import '../../../widgets/passenger.dart';
import '../../../widgets/product_is_purcharsed.dart';
import '../controller/manager_controller.dart';

class OrderConfirmation extends StatefulWidget {
  OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.read<OrderController>();
    return ChangeNotifierProvider(
      create: (context) => ManagerController(),
      child: Consumer<ManagerController>(
        builder: (context, managerController, child) {
          return Scaffold(
            body: Column(
              children: [
                HeaderCenter(txt_header: 'Xác nhận đơn hàng'),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  for (int i = 0;
                                      i <
                                          orderController
                                              .selectedItemList.length;
                                      i++)
                                    ProductIsPurcharsed(
                                      index: i,
                                    ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(5),
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColors.green_006200,
                                            width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.add,
                                          color: AppColors.green_006200,
                                        ),
                                        Text(
                                          'Thêm sản phẩm',
                                          style: TextStyle(
                                              color: AppColors.green_006200,
                                              fontSize: AppDimens.dimens_16,
                                              fontWeight: FontFamily.medium),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Passenger(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    margin: EdgeInsets.only(top: 10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 230,
                                    color: AppColors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Text(
                                                'Chọn khuyễn mãi',
                                                style: TextStyle(
                                                    color:
                                                        AppColors.green_55b135,
                                                    fontSize:
                                                        AppDimens.dimens_13),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  fontWeight:
                                                      FontFamily.medium),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                      fontSize:
                                                          AppDimens.dimens_13,
                                                      fontWeight:
                                                          FontFamily.medium),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                      fontSize:
                                                          AppDimens.dimens_13,
                                                      fontWeight:
                                                          FontFamily.medium),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Tổng cộng',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.black,
                                                  fontWeight:
                                                      FontFamily.medium),
                                            ),
                                            Text(
                                              '${orderController.totalMoney} đ',
                                              style: TextStyle(
                                                  color: AppColors.red_FC0000,
                                                  fontSize: AppDimens.dimens_20,
                                                  fontWeight:
                                                      FontFamily.medium),
                                            )
                                          ],
                                        ),
                                        OutlinedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                                side: BorderSide(
                                                    color:
                                                        AppColors.blue_0000ff,
                                                    width: 1)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.account_balance_wallet,
                                                  color: AppColors.blue_0000ff,
                                                ),
                                                Text(
                                                  'Thanh toán trước',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .blue_0000ff),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width: MediaQuery.of(context).size.width,
                                    height: AppDimens.dimens_70,
                                    color: AppColors.white,
                                    child: SizedBox(
                                      height: AppDimens.dimens_40,
                                      child: TextField(
                                        controller:
                                            orderController.noteOrderController,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        decoration: InputDecoration(
                                          hintText: 'Ghi chú khách hàng',
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => managerController
                                        .setDateTimeOrder(context),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      color: AppColors.grey_8A8A8A
                                          .withOpacity(0.2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.calendar_month,
                                              color: AppColors.blue_0000ff
                                                  .withOpacity(0.8)),
                                          SizedBox(
                                            width: AppDimens.dimens_20,
                                          ),
                                          Text(
                                            managerController.dateOrder
                                                .split(' ')[0],
                                            style: TextStyle(
                                                fontSize: AppDimens.dimens_20,
                                                color: AppColors.blue_0000ff
                                                    .withOpacity(0.8),
                                                fontWeight:
                                                    FontFamily.semiBold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Buttom_2(
                                      txt_left: 'Giao sau',
                                      txt_rightt: 'Bán nhanh')
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
