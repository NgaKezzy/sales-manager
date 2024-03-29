import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
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
  late OrderController orderController;
  late ProductsController productsController;
  void didChangeDependencies() {
    orderController = context.read<OrderController>();
    productsController = context.read<ProductsController>();
    orderController.idOrder = orderController.listItemOrder[widget.index].id;
    orderController.sumPriceOrderDetail();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.read<OrderController>();
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Column(
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
                      // Text(
                      //   orderController.listItemOrder[widget.index].id
                      //       .substring(18, 24)
                      //       .toString(),
                      //   style: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontFamily.medium,
                      //       color: AppColors.red_FC0000),
                      // ),
                      Text(
                        orderController
                            .listItemOrder[widget.index].purchaseDate,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${NumberFormat.decimalPattern().format(orderController.totalPriceOrderDetail)}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontFamily.medium),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: AppColors.grey_808080.withOpacity(0.1),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: AppDimens.dimens_30,
                    backgroundImage: AssetImage('assets/img/avatar.png'),
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
              color: AppColors.grey_808080.withOpacity(0.1),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Tổng ${orderController.listItemOrderDetail.length} sản phẩm'),
                        Text(
                          '${NumberFormat.decimalPattern().format(orderController.totalPriceOrderDetail)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phí vận chuyển'),
                        Text('0'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Chiết khấu'),
                        Text('0'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng cộng',
                          style: TextStyle(
                              fontWeight: FontFamily.medium, fontSize: 18),
                        ),
                        Text(
                          '${NumberFormat.decimalPattern().format(orderController.totalPriceOrderDetail)}',
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: orderController.listItemOrderDetail.length,
                itemBuilder: (context, index) {
                  return ProductOfDetailOrder(
                    element: index,
                  );
                },
              ),
            ),
          ],
        ),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(orderController
                      .listItemOrderDetail[element].productImage),
                  fit: BoxFit.cover),
            ),
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
                  orderController.listItemOrderDetail[element].productName,
                  style: TextStyle(fontWeight: FontFamily.medium),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SL: ${orderController.listItemOrderDetail[element].quantity}',
                      style: TextStyle(),
                    ),
                    Text(
                      orderController.listItemOrderDetail[element].price
                          .toString(),
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
