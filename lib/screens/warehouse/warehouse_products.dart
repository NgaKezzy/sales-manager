import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/warehouse/product_details.dart';

import '../manager/controller/products_controller.dart';
import '../spending/expenses.dart';
import '../spending/revenue.dart';

class WarehouseProducts extends StatefulWidget {
  const WarehouseProducts({super.key});

  @override
  State<WarehouseProducts> createState() => _WarehouseProductsState();
}

class _WarehouseProductsState extends State<WarehouseProducts> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    // context.watch<ProductsController>().resultProducts.length;

    return Container(
      color: AppColors.grey_8A8A8A.withOpacity(0.1),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: AppDimens.dimens_120,
            width: MediaQuery.of(context).size.width,
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productsController.resultProducts.length} mã sản phẩm',
                  style: TextStyle(
                      fontWeight: FontFamily.medium,
                      fontSize: AppDimens.dimens_16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: AppDimens.dimens_70,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: AppColors.grey_8A8A8A.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.attach_money,
                                size: 18,
                                color: AppColors.green_55b135,
                              ),
                              Text('Giá trị tồn')
                            ],
                          ),
                          Text(
                            NumberFormat.decimalPattern().format(
                              context.watch<ProductsController>().totalValue(),
                            ),
                            style: TextStyle(
                                color: AppColors.green_55b135,
                                fontWeight: FontFamily.semiBold,
                                fontSize: AppDimens.dimens_20),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: AppDimens.dimens_70,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: AppColors.grey_8A8A8A.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.token,
                                size: 18,
                                color: AppColors.green_55b135,
                              ),
                              Text(' Số lượng')
                            ],
                          ),
                          Text(
                            '15',
                            style: TextStyle(
                                color: AppColors.green_55b135,
                                fontWeight: FontFamily.semiBold,
                                fontSize: AppDimens.dimens_16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0, bottom: 60),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: productsController.resultProducts.length,
              itemBuilder: (context, index) {
                return productsController.isLoading
                    ? ItemWareHouseProduct(
                        element: index,
                      )
                    : CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemWareHouseProduct extends StatelessWidget {
  ItemWareHouseProduct({
    required this.element,
    super.key,
  });

  int element;

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      index: element,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productsController
                          .resultProducts[element].productImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${productsController.resultProducts[element].productName}',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_14, color: AppColors.black),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Tồn kho : ${productsController.resultProducts[element].inventoryNumber}",
                  style: TextStyle(
                      fontSize: AppDimens.dimens_14, color: AppColors.black),
                ),
                Text(
                  '${NumberFormat.decimalPattern().format(productsController.resultProducts[element].inventoryNumber * productsController.resultProducts[element].price)} đ',
                  style: TextStyle(
                      fontWeight: FontFamily.medium,
                      fontSize: AppDimens.dimens_16,
                      color: AppColors.red_FF5151),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
