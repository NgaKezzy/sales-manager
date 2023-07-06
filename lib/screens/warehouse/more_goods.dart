import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../manager/product/create_product.dart';
import 'create_import_goods.dart';

class MoreGoods extends StatelessWidget {
  const MoreGoods({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    context.watch<ProductsController>().resultProducts.length;

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
                  // margin: EdgeInsets.only(right: 10),
                  child: Text(
                    'Nhập hàng',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.black,
                      fontWeight: FontFamily.medium,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProduct()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.green_55b135,
                    ),
                    width: AppDimens.dimens_24,
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: productsController.resultProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMoreGoods(
                      element: index,
                    );
                  })),
        ],
      ),
    );
  }
}

class ItemMoreGoods extends StatefulWidget {
  ItemMoreGoods({
    required this.element,
    super.key,
  });

  int element = 0;

  @override
  State<ItemMoreGoods> createState() => _ItemMoreGoodsState();
}

class _ItemMoreGoodsState extends State<ItemMoreGoods> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    OrderController orderController = context.read<OrderController>();

    return InkWell(
      onTap: () {
        orderController.itemPost.clear();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateImportGoods(
                      item: widget.element,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        height: AppDimens.dimens_90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              height: AppDimens.dimens_60,
              width: AppDimens.dimens_60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productsController
                          .resultProducts[widget.element].productImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productsController.resultProducts[widget.element].productName,
                  style: TextStyle(fontSize: 15, fontWeight: FontFamily.medium),
                ),
                Text(
                  'Còn: ${productsController.resultProducts[widget.element].inventoryNumber} Sp',
                  style: TextStyle(color: AppColors.grey_8A8A8A),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Giá bán : ${NumberFormat.decimalPattern().format(productsController.resultProducts[widget.element].price)} đ',
                  style: TextStyle(color: AppColors.green_006200),
                ),
                Text(
                  'Giá nhập : ${NumberFormat.decimalPattern().format(productsController.resultProducts[widget.element].importPrice)} đ',
                  style: TextStyle(color: AppColors.red_FC0000),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
