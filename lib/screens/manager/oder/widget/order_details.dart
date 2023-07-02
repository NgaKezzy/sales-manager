import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../../login_and_init_shop/controller/auth_controller.dart';

class OderDetail extends StatefulWidget {
  OderDetail({required this.index, super.key});
  int index = 0;

  @override
  State<OderDetail> createState() => _OderDetailState();
}

class _OderDetailState extends State<OderDetail> {
  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.read<OrderController>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: AppDimens.dimens_80,
            decoration: BoxDecoration(color: AppColors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    orderController.elementsProductOfOrderDetail.clear();
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    'Chi tiết đơn hàng',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.black,
                      fontWeight: FontFamily.medium,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showAlertDialog(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: AppDimens.dimens_24,
                    child: Icon(
                      Icons.delete,
                      size: 24,
                      color: AppColors.red_FC0000,
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
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
                            orderController.listItemOrder[widget.index].id
                                .substring(18, 24)
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontFamily.medium,
                                color: AppColors.red_FC0000),
                          ),
                          Text(orderController
                              .listItemOrder[widget.index].purchaseDate)
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
                  margin: EdgeInsets.only(top: 10, bottom: 10),
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontFamily.medium),
                      )
                    ],
                  ),
                ),
                for (int i = 0;
                    i < orderController.elementsProductOfOrderDetail.length;
                    i++)
                  ProductOfDetailOrder(
                    element: i,
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
                // Container(
                //     margin: EdgeInsets.only(top: 20),
                //     width: MediaQuery.of(context).size.width * 0.7,
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             backgroundColor: AppColors.red_FC0000),
                //         onPressed: () {},
                //         child: Text("Xóa đơn hàng")))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductOfDetailOrder extends StatelessWidget {
  ProductOfDetailOrder({
    required this.element,
    super.key,
  });

  int element = 0;

  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.read<OrderController>();
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
              bottom: BorderSide(
                  color: AppColors.grey_8A8A8A.withOpacity(0.5),
                  width: AppDimens.dimens_1))),
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
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderController
                      .elementsProductOfOrderDetail[element].productName,
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
                    Text(
                      '300.000',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontFamily.medium),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _showAlertDialog(BuildContext context) {
  OrderController orderController = context.read<OrderController>();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Xóa đơn hàng ?'),
        content: Text('Bạn có chắc rằng muốn xóa đơn hàng ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              orderController.deleteOrder();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Xóa'),
          ),
        ],
      );
    },
  );
}
