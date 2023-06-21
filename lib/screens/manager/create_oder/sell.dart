import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/screens/manager/report/controller/products_controller.dart';
import 'package:sales_manager/widgets/add_product.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../../config/app.font.dart';
import '../../login_and_init_shop/controller/auth_controller.dart';
import '../../warehouse/product_details.dart';
import '../product/create_product.dart';
import 'order_confirmation.dart';

// màn bán hàng

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  late ProductsController productsController;
  late AuthController authController;
  @override
  void didChangeDependencies() {
    authController = context.read<AuthController>();
    productsController = context.read<ProductsController>();
    productsController
        .getdataProducts(authController.userLogin?.idWarehouse ?? '');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                HeaderCenter(txt_header: 'Bán hàng'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: AppDimens.dimens_45,
                  width: MediaQuery.of(context).size.width,
                  child: const TextField(
                    textCapitalization: TextCapitalization.sentences,
                    textAlignVertical: TextAlignVertical(y: 0.9),
                    obscureText: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: AppColors.green_55b135,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Tìm theo tên sản phẩm',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              color: AppColors.grey_8A8A8A.withOpacity(0.2),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    ...List.generate(productsController.resultProducts.length,
                        (index) {
                      return ItemListProduct(
                        element: index,
                      );
                    }),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListProduct extends StatelessWidget {
  ItemListProduct({
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
              builder: (context) => OrderConfirmation(),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.all(5),
        height: 130,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            width: MediaQuery.of(context).size.width * 0.3,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: Colors.green,
            ),
            child: Text(
              '${productsController.resultProducts[element].quantity}',
              style: TextStyle(
                  fontSize: 13,
                  color: AppColors.white,
                  fontWeight: FontFamily.medium),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.3,
            height: 60,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.only(
            //     topRight: Radius.circular(10),
            //     topLeft: Radius.circular(10),
            //   ),
            // ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${productsController.resultProducts[element].productName}',
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.black,
                        fontWeight: FontFamily.medium,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    '${productsController.resultProducts[element].price}',
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.black,
                        fontWeight: FontFamily.medium),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
