import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
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
        .getDataProducts(authController.userLogin?.idWarehouse ?? '');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    OrderController orderController = context.read<OrderController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
                          orderController.selectedItemList.clear();
                          orderController.checkSelected = false;
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
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          'Bán hàng',
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                            fontWeight: FontFamily.medium,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppDimens.dimens_24,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: AppDimens.dimens_40,
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
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 80),
                  color: AppColors.grey_8A8A8A.withOpacity(0.2),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 120,
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        ...List.generate(
                            productsController.resultProducts.length, (index) {
                          return ItemListProduct(
                            element: index,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                // orderController.checkSelected == true

                for (int i = 0;
                    i < productsController.checkProducts.length;
                    i++)
                  if (productsController.checkProducts[i] == true)
                    Positioned(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: AppDimens.dimens_35),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: AppDimens.dimens_40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.green_006200),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderConfirmation(),
                                  ));
                            },
                            child: Text('Xác nhận'),
                          ),
                        ),
                      ],
                    )),
              ],
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
    OrderController orderController = context.read<OrderController>();
    return InkWell(
      onTap: () {
        productsController.checkHide(element);
        orderController.checkSelected = true;

        orderController.selectedItemList
            .add(productsController.resultProducts[element]);
        printRed('${orderController.selectedItemList}');
      },
      child: Stack(
        alignment: Alignment(0, -0.6),
        children: [
          Container(
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
                  'Còn : ${productsController.resultProducts[element].inventoryNumber}',
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
                        NumberFormat.decimalPattern().format(
                            productsController.resultProducts[element].price),
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.black,
                            fontWeight: FontFamily.medium),
                      ),
                    ]),
              )
            ]),
          ),
          if (productsController.checkProducts[element])
            Positioned(
                child: Container(
              width: AppDimens.dimens_30,
              height: AppDimens.dimens_30,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.check,
                color: AppColors.green_55b135,
              ),
            )),
        ],
      ),
    );
  }
}
