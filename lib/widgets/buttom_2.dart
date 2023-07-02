import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/screens/manager/controller/order_controller.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';

class Buttom_2 extends StatefulWidget {
  Buttom_2({required this.txt_Left, required this.txt_Rightt, super.key});

  final String txt_Left;
  final String txt_Rightt;

  @override
  State<Buttom_2> createState() => _Buttom_2State();
}

class _Buttom_2State extends State<Buttom_2> {
  @override
  Widget build(BuildContext context) {
    OrderController orderController = context.read<OrderController>();
    ProductsController productController = context.read<ProductsController>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 10, bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: AppDimens.dimens_45,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              widget.txt_Left,
              style: TextStyle(color: AppColors.black),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
          height: AppDimens.dimens_45,
          child: ElevatedButton(
            onPressed: () {
              orderController
                  .convertToListProduct(productController.resultProducts);
              printBlue(orderController.itemPost.toString());
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      // <-- SEE HERE
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimens.dimens_24,
                              ),
                              Text(
                                'Xác nhận thanh toán',
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_16,
                                    color: AppColors.black,
                                    fontWeight: FontFamily.medium),
                              ),
                              InkWell(
                                onTap: () {

                                  Navigator.pop(context);
                                  

                                },
                                child: Icon(
                                  Icons.close,
                                  size: 24,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                orderController.totalMoney.toString(),
                                style: TextStyle(
                                    fontSize: AppDimens.dimens_25,
                                    color: AppColors.red_FC0000,
                                    fontWeight: FontFamily.medium),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppDimens.dimens_20,
                          ),
                          Text('Nguồn tiền'),
                          SizedBox(
                            height: AppDimens.dimens_10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  orderController.funds = "Tiền mặt";
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: AppDimens.dimens_100,
                                  height: AppDimens.dimens_35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            orderController.funds == "Tiền mặt"
                                                ? AppColors.blue_0000ff
                                                : AppColors.grey_808080,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Tiền mặt',
                                    style: TextStyle(
                                      fontWeight: FontFamily.medium,
                                      color: orderController.funds == "Tiền mặt"
                                          ? AppColors.blue_0000ff
                                          : AppColors.grey_808080,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  orderController.funds = "Ví điện tử";
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: AppDimens.dimens_100,
                                  height: AppDimens.dimens_35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: orderController.funds ==
                                                "Ví điện tử"
                                            ? AppColors.blue_0000ff
                                            : AppColors.grey_808080,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Ví điện tử',
                                    style: TextStyle(
                                        fontWeight: FontFamily.medium,
                                        color: orderController.funds ==
                                                "Ví điện tử"
                                            ? AppColors.blue_0000ff
                                            : AppColors.grey_808080),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  orderController.funds = "Ngân hàng";
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: AppDimens.dimens_100,
                                  height: AppDimens.dimens_35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            orderController.funds == "Ngân hàng"
                                                ? AppColors.blue_0000ff
                                                : AppColors.grey_808080,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Ngân hàng',
                                    style: TextStyle(
                                        fontWeight: FontFamily.medium,
                                        color:
                                            orderController.funds == "Ngân hàng"
                                                ? AppColors.blue_0000ff
                                                : AppColors.grey_808080),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppDimens.dimens_10,
                          ),
                          Text(
                            'Nhận tiền đối soát tự động',
                          ),
                          SizedBox(
                            height: AppDimens.dimens_10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: AppDimens.dimens_80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.grey_8A8A8A, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/img/visa.png'),
                                        height: AppDimens.dimens_40,
                                      ),
                                      Text(
                                        'Link thanh toán',
                                        style: TextStyle(),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: AppDimens.dimens_80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.grey_8A8A8A, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('assets/img/momo.png'),
                                        height: AppDimens.dimens_30,
                                      ),
                                      Text(
                                        'QR thanh toán',
                                        style: TextStyle(),
                                      )
                                    ]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppDimens.dimens_20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: AppDimens.dimens_45,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.green_006200),
                                onPressed: () {
                                  printBlue('click');
                                  orderController.createOrder();
                                  orderController
                                      .customersOrderController.text = '';
                                  orderController.noteOrderController.text = '';
                                  orderController.funds = 'Tiền mặt';
                                  Navigator.pop(context);
                                  productController.addFalseProduct();
                                  orderController.selectedItemList.clear();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Xác nhận',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_16,
                                      fontWeight: FontFamily.medium),
                                )),
                          )
                        ],
                      ),
                    );
                  });
            },
            style: ElevatedButton.styleFrom(primary: AppColors.green_006200),
            child: Text(widget.txt_Rightt),
          ),
        ),
      ]),
    );
  }
}
