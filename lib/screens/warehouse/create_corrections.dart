import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/screens/warehouse/update_quantity.dart';
import 'package:sales_manager/widgets/header_center.dart';

import 'create_a_decrease_adjustment.dart';

class CreateCorrections extends StatelessWidget {
  const CreateCorrections({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Chọn sản phẩm giảm'),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0, bottom: 20),
                itemCount: productsController.resultProducts.length,
                itemBuilder: (context, index) {
                  return ItemSelectProduct(
                    item: index,
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

class ItemSelectProduct extends StatefulWidget {
  ItemSelectProduct({
    required this.item,
    super.key,
  });

  int item = 0;

  @override
  State<ItemSelectProduct> createState() => _ItemSelectProductState();
}

class _ItemSelectProductState extends State<ItemSelectProduct> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return InkWell(
      onTap: () {
        productsController.resultProducts[widget.item].inventoryNumber <= 0
            ? Fluttertoast.showToast(
                msg: 'Số lượng đạt tối thiểu không thể giảm')
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => UpdateQuantity(
                          index: widget.item,
                        ))));
      },
      child: Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.all(10),
        height: AppDimens.dimens_100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 30),
              height: AppDimens.dimens_80,
              width: AppDimens.dimens_80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productsController
                          .resultProducts[widget.item].productImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productsController.resultProducts[widget.item].productName,
                  style: TextStyle(fontSize: 15, fontWeight: FontFamily.medium),
                ),
                Text(
                  'Tồn kho : ${productsController.resultProducts[widget.item].inventoryNumber}',
                  style: TextStyle(color: AppColors.grey_8A8A8A),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
