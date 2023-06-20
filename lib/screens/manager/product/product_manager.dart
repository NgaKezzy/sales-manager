import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/report/controller/products_controller.dart';

import '../../../config/app_color.dart';
import '../../warehouse/product_details.dart';
import '../oder/widget/order_details.dart';

class ProductManager extends StatefulWidget {
  const ProductManager({super.key});

  @override
  State<ProductManager> createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Container(
      color: AppColors.grey_8A8A8A.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                    DisplayList(
                      nameDisplay: 'Điện tử',
                    ),
                    DisplayList(
                      nameDisplay: 'Dân dụng',
                    ),
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount:
                  context.watch<ProductsController>().resultProducts.length,
              itemBuilder: (context, index) {
                return productsController.isLoading
                    ? ItemProductManager(ele: index)
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ItemProductManager extends StatelessWidget {
  const ItemProductManager({
    required this.ele,
    super.key,
  });
  final int ele;

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Container(
        margin: EdgeInsets.only(top: AppDimens.dimens_10),
        height: AppDimens.dimens_80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: AppDimens.dimens_60,
              width: AppDimens.dimens_60,
              decoration: BoxDecoration(
                  color: AppColors.green_006200,
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: AppDimens.dimens_15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productsController.resultProducts[ele].productName,
                  style: TextStyle(
                      fontSize: AppDimens.dimens_16,
                      fontWeight: FontFamily.medium),
                ),
                Text(
                  'Có thể bán : ${productsController.resultProducts[ele].quantity}',
                  style: TextStyle(
                    fontSize: AppDimens.dimens_13,
                  ),
                ),
                Text(
                  productsController.resultProducts[ele].price.toString(),
                  style: TextStyle(
                      fontSize: AppDimens.dimens_16,
                      fontWeight: FontFamily.medium,
                      color: AppColors.red_FC0000),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DisplayList extends StatelessWidget {
  const DisplayList({
    required this.nameDisplay,
    super.key,
  });

  final String nameDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      height: AppDimens.dimens_40,
      width: AppDimens.dimens_80,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.blue_0000ff.withOpacity(0.5),
            width: AppDimens.dimens_1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        nameDisplay,
        style: TextStyle(
            fontSize: AppDimens.dimens_13, color: AppColors.blue_0000ff),
      ),
    );
  }
}
