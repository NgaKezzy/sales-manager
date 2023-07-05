import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';

class UpdateQuantity extends StatefulWidget {
  UpdateQuantity({required this.index, super.key});

  int index = 0;

  @override
  State<UpdateQuantity> createState() => _UpdateQuantityState();
}

class _UpdateQuantityState extends State<UpdateQuantity> {
  late ProductsController productsController;
  void didChangeDependencies() {
    productsController = context.read<ProductsController>();
    productsController.nameReduce =
        productsController.resultProducts[widget.index].productName;
    productsController.priceReduce =
        productsController.resultProducts[widget.index].price;
    productsController.importPriceReduce =
        productsController.resultProducts[widget.index].importPrice;
    productsController.idProduct =
        productsController.resultProducts[widget.index].id;
    productsController.quantityReduce =
        productsController.resultProducts[widget.index].inventoryNumber;
    productsController.sumMoneyBefore =
        productsController.resultProducts[widget.index].inventoryNumber *
            productsController.resultProducts[widget.index].price;
    productsController.sumImporPrice =
        productsController.resultProducts[widget.index].inventoryNumber *
            productsController.resultProducts[widget.index].importPrice;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Chỉnh giảm'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: AppDimens.dimens_120,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.grey_8A8A8A.withOpacity(0.1),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: AppDimens.dimens_90,
                          width: AppDimens.dimens_90,
                          color: AppColors.blue_028f76,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tên sản phẩm ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontFamily.medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          productsController
                              .resultProducts[widget.index].productName,
                          style: TextStyle(
                              fontSize: 16, color: AppColors.green_006200),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Giá bán ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontFamily.medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${NumberFormat.decimalPattern().format(productsController.resultProducts[widget.index].price)}  đ',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.green_006200,
                              fontWeight: FontFamily.medium),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Giá nhập ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontFamily.medium),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${NumberFormat.decimalPattern().format(productsController.resultProducts[widget.index].importPrice)}  đ',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.red_FC0000,
                              fontWeight: FontFamily.medium),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Số lượng giảm',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontFamily.medium,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller:
                                        productsController.reduceInventory,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Nhập số lượng giảm',
                                      isDense: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: AppColors.grey_808080
                                                .withOpacity(
                                                    0.6)), //<-- SEE HERE
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: AppColors
                                                .grey_808080), //<-- SEE HERE
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: AppColors
                                                .red_FF5151), //<-- SEE HERE
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color:
                                                AppColors.black), //<-- SEE HERE
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: AppDimens.dimens_30,
                        ),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green_006200),
                              onPressed: () {
                                productsController.sumMoneyReduce =
                                    productsController
                                            .resultProducts[widget.index]
                                            .price *
                                        int.parse(productsController
                                            .reduceInventory.text);

                                productsController.sumImporPriceReduce =
                                    productsController
                                            .resultProducts[widget.index]
                                            .importPrice *
                                        int.parse(productsController
                                            .reduceInventory.text);
                                productsController.reduceQuantity();
                              },
                              child: Text('Cập nhật')),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
