import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/report/warehouse.dart';

import '../../../../config/app.font.dart';
import '../../../../config/app_color.dart';
import '../../../../config/app_size.dart';
import '../../controller/statistical_controller.dart';
import 'item_warehouse_quantity.dart';

class Quantity extends StatelessWidget {
  const Quantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    StatisticalController statisticalController = context.read<StatisticalController>();
    context.watch<StatisticalController>().resultStatisticalDateNow;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng quan số lượng hàng',
            style: TextStyle(
                fontSize: AppDimens.dimens_16, fontWeight: FontFamily.medium),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sản phẩm',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
              Text(
                'Số lượng',
                style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                    color: AppColors.grey_8A8A8A),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ItemWarehouseQuantity()
        ],
      ),
    );
  }
}
