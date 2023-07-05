import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../../config/print_color.dart';
import '../manager/controller/order_controller.dart';

class CreateImportGoods extends StatefulWidget {
  CreateImportGoods({required this.item, super.key});
  int item = 0;

  @override
  State<CreateImportGoods> createState() => _CreateImportGoodsState();
}

class _CreateImportGoodsState extends State<CreateImportGoods> {
  late ProductsController productsController;
  late OrderController orderController;
  void didChangeDependencies() {
    productsController = context.read<ProductsController>();
    orderController = context.read<OrderController>();

    productsController.idProduct =
        productsController.resultProducts[widget.item].id;
    productsController.nameProduct =
        productsController.resultProducts[widget.item].productName;
    productsController.priceProduct =
        productsController.resultProducts[widget.item].price;
    productsController.priceImportProduct =
        productsController.resultProducts[widget.item].importPrice;

    orderController.itemPost
        .add(productsController.resultProducts[widget.item]);
    productsController.totalProduct = 0;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    OrderController orderController = context.read<OrderController>();
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Tạo nhập hàng'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          SelectedItem(
                            index: widget.item,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            color: AppColors.white,
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Ghi chú',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          color: AppColors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: AppDimens.dimens_30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tổng số lượng',
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                      ),
                                    ),
                                    Text(
                                      orderController
                                          .quantityImportProduct.text,
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontFamily.medium),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.dimens_30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tổng tiền hàng',
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                      ),
                                    ),
                                    Text(
                                      ' ${NumberFormat.decimalPattern().format(orderController.sumMoneyImportProduct)}',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontFamily.medium),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.dimens_30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Chiết khấu',
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                      ),
                                    ),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontFamily.medium),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.dimens_30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Chi phí phát sinh',
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                      ),
                                    ),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontFamily.medium),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.dimens_30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tổng cộng',
                                      style: TextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                      ),
                                    ),
                                    Text(
                                      ' ${NumberFormat.decimalPattern().format(orderController.sumMoneyImportProduct)} đ',
                                      style: TextStyle(
                                          color: AppColors.red_FC0000,
                                          fontWeight: FontFamily.medium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green_006200),
                              onPressed: () {
                                orderController.addItemPost(
                                    productsController.resultProducts,
                                    widget.item);

                                productsController.totalProduct =
                                    productsController
                                            .resultProducts[widget.item]
                                            .inventoryNumber +
                                        int.parse(orderController
                                            .quantityImportProduct.text);

                                productsController.importProduct();
                                orderController.createOrderImportProduct();
                                Navigator.pop(context);
                              },
                              child: Text('Thanh toán'),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class SelectedItem extends StatefulWidget {
  SelectedItem({
    required this.index,
    super.key,
  });

  int index = 0;

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  late OrderController orderController;
  void didChangeDependencies() {
    orderController = context.read<OrderController>();
    orderController.quantityImportProduct.text = '1';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    OrderController orderController = context.read<OrderController>();
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      height: AppDimens.dimens_100,
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
                color: AppColors.pink_FA4881,
                borderRadius: BorderRadius.circular(5)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${productsController.resultProducts[widget.index].productName}',
                style: TextStyle(fontSize: 15, fontWeight: FontFamily.medium),
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
                        orderController.downQuantity();
                        orderController.sumMoney(productsController
                            .resultProducts[widget.index].price);
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
                        orderController.sumMoney(productsController
                            .resultProducts[widget.index].price);
                      },
                      controller: orderController.quantityImportProduct,
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
                        orderController.upQuantity();
                        orderController.sumMoney(productsController
                            .resultProducts[widget.index].price);
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
          Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  'Giá: ${productsController.resultProducts[widget.index].price} x 1'),
            ],
          )
        ],
      ),
    );
  }
}
