import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';
import '../screens/manager/oder/widget/order_details.dart';

class ItemOder extends StatefulWidget {
  ItemOder({required this.element, super.key});
  int element = 0;

  @override
  State<ItemOder> createState() => _ItemOderState();
}

class _ItemOderState extends State<ItemOder> {
  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.read<OrderController>();
    return InkWell(
      onTap: () {
        orderController.idOrder =
            orderController.listItemOrder[widget.element].id;
        orderController.getOrderDetail();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OderDetail(
                      index: widget.element,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(
            top: AppDimens.dimens_15,
            left: AppDimens.dimens_10,
            right: AppDimens.dimens_10),
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 25,
        height: AppDimens.dimens_130,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey_8A8A8A.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderController.listItemOrder[widget.element].customerName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontFamily.medium,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: AppDimens.dimens_20,
                  width: AppDimens.dimens_60,
                  decoration: BoxDecoration(
                      color: AppColors.blue_028f76.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Đã giao',
                    style: TextStyle(
                        color: AppColors.blue_028f76,
                        fontSize: AppDimens.dimens_13),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  orderController.listItemOrder[widget.element].purchaseDate,
                  style: TextStyle(
                    color: AppColors.grey_8A8A8A,
                    fontSize: AppDimens.dimens_15,
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.grey_8A8A8A,
              height: AppDimens.dimens_1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng cộng',
                ),
                Text(
                  '${NumberFormat.decimalPattern().format(orderController.listItemOrder[widget.element].totalPrice)}',
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: AppDimens.dimens_20,
                      fontWeight: FontFamily.medium),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Đã thanh toán',
                  style: TextStyle(
                    color: AppColors.blue_028f76,
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
