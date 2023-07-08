import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/screens/manager/report/warehouse.dart';

import '../../../../config/app.font.dart';
import '../../../../config/app_color.dart';
import '../../../../config/app_size.dart';
import '../../controller/statistical_controller.dart';
import 'item_warehouse_value.dart';

class WarehouseValue extends StatefulWidget {
  const WarehouseValue({
    super.key,
  });

  @override
  State<WarehouseValue> createState() => _WarehouseValueState();
}

class _WarehouseValueState extends State<WarehouseValue> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    StatisticalController statisticalController =
        context.read<StatisticalController>();

    context.watch<StatisticalController>().resultStatisticalDateNow;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tổng quan giá trị kho',
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
                  'Giá trị',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_13,
                      color: AppColors.grey_8A8A8A),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 0,
                ),
                itemCount: productsController.resultProducts.length,
                itemBuilder: (context, index) {
                  return ItemWarehouseValue(element: index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
