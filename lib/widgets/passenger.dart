import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';

class Passenger extends StatelessWidget {
  const Passenger({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.watch<OrderController>();
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Khách hàng',
            style: TextStyle(
                fontSize: AppDimens.dimens_16, fontWeight: FontFamily.medium),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: AppDimens.dimens_40,
                child: TextField(
                  controller: orderController.customersOrderController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'Thông tin khách hàng',
                    suffixIcon: Icon(Icons.account_circle),
                    suffixIconColor: AppColors.green_04D0CA,
                    hintStyle:
                        TextStyle(fontSize: 15, color: AppColors.grey_8A8A8A),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
