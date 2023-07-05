import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/print_color.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';
import '../screens/manager/controller/order_controller.dart';
import '../screens/manager/controller/products_controller.dart';

class ProductIsPurcharsed extends StatefulWidget {
  ProductIsPurcharsed(
      {required this.index, required this.indexTextField, super.key});
  final int index;
  final int indexTextField;

  @override
  State<ProductIsPurcharsed> createState() => _ProductIsPurcharsedState();
}

class _ProductIsPurcharsedState extends State<ProductIsPurcharsed> {
  @override
  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.watch<OrderController>();
    ProductsController productsController = context.read<ProductsController>();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_90,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(width: 1, color: AppColors.grey_8A8A8A)),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: AppDimens.dimens_70,
                height: AppDimens.dimens_70,
                color: AppColors.pink_FA4881,
              ),
              Positioned(
                  top: -7,
                  left: -7,
                  child: InkWell(
                    onTap: () {
                      {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: AppDimens.dimens_30,
                      width: AppDimens.dimens_30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.grey_8A8A8A),
                      child: Icon(
                        Icons.close,
                        color: AppColors.white,
                        size: 15,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            width: AppDimens.dimens_10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productsController.resultProducts[widget.index].productName,
                style: TextStyle(
                    fontWeight: FontFamily.medium,
                    fontSize: AppDimens.dimens_16,
                    overflow: TextOverflow.ellipsis),
              ),
              Container(
                alignment: Alignment.center,
                width: AppDimens.dimens_100,
                height: AppDimens.dimens_25,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey_8A8A8A),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        orderController
                            .changeQuantityDown(widget.indexTextField);
                        orderController
                            .sumPrice(productsController.resultProducts);
                      },
                      child: SizedBox(
                        width: AppDimens.dimens_33,
                        height: AppDimens.dimens_35,
                        child: Icon(
                          Icons.remove,
                          size: 18,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        orderController
                            .sumPrice(productsController.resultProducts);
                      },
                      controller: orderController
                          .listQuantityController[widget.indexTextField],
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontWeight: FontFamily.medium,
                          fontSize: AppDimens.dimens_13),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    )),
                    InkWell(
                      onTap: () {
                        orderController.changeQuantityUp(widget.indexTextField);
                        orderController
                            .sumPrice(productsController.resultProducts);
                      },
                      child: SizedBox(
                        width: AppDimens.dimens_33,
                        height: AppDimens.dimens_35,
                        child: Icon(
                          Icons.add,
                          size: 18,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomRight,
            child: Text(
              NumberFormat.decimalPattern().format(
                  productsController.resultProducts[widget.index].price),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontFamily.medium,
                  color: AppColors.red_FC0000),
            ),
          ))
        ],
      ),
    );
  }
}
