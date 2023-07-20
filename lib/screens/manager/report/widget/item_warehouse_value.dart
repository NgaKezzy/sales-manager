import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';

import '../../../../config/app.font.dart';
import '../../../../config/app_color.dart';
import '../../../../config/app_size.dart';

class ItemWarehouseValue extends StatelessWidget {
  ItemWarehouseValue({
    required this.element,
    super.key,
  });

  int element;

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      color: AppColors.white,
      child: Row(
        children: [
          Text(
            '${element + 1}',
            style: TextStyle(
                fontWeight: FontFamily.medium,
                fontSize: AppDimens.dimens_16,
                color: AppColors.black),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(
                        '${productsController.resultProducts[element].productImage}'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productsController.resultProducts[element].productName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: AppDimens.dimens_13,
                        fontWeight: FontFamily.medium),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${NumberFormat.decimalPattern().format(productsController.resultProducts[element].inventoryNumber * productsController.resultProducts[element].price)} đ',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_13,
                        color: AppColors.blue_028f76,
                        fontWeight: FontFamily.medium),
                  ),
                  Text(
                    'SL :${productsController.resultProducts[element].inventoryNumber}',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_14,
                        color: AppColors.grey_8A8A8A),
                  )
                ],
              ),
            ],
          ))
        ],
      ),
      // Container(
      //   height: 1,
      //   width: MediaQuery.of(context).size.width,
      //   color: AppColors.grey_8A8A8A,
      // )
    );
  }
}
