import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({required this.index, super.key});
  int? index = 0;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  void initState() {
    ProductsController productsController = context.read<ProductsController>();
    productsController.nameUpdateController.text =
        productsController.resultProducts[widget.index!].productName;

    productsController.priceUpdateController.text =
        productsController.resultProducts[widget.index!].price.toString();

    productsController.importPriceUpdateController.text =
        productsController.resultProducts[widget.index!].importPrice.toString();

    productsController.inventoryNumberUpdateController.text = productsController
        .resultProducts[widget.index!].inventoryNumber
        .toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
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
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    'Chi tiết sản phẩm',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.black,
                      fontWeight: FontFamily.medium,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showAlertDialog(context);
                  },
                  child: Icon(
                    Icons.delete,
                    size: AppDimens.dimens_24,
                    color: AppColors.red_FC0000,
                  ),
                )
              ],
            ),
          ),
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(productsController
                                    .resultProducts[
                                        productsController.indexProduct]
                                    .productImage),
                                fit: BoxFit.cover),
                          ),
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
                          height: 45,
                          child: TextFormField(
                            controller: productsController.nameUpdateController,
                            decoration: InputDecoration(
                              hintText: productsController
                                  .resultProducts[
                                      productsController.indexProduct]
                                  .productName
                                  .toString(),
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.grey_808080
                                        .withOpacity(0.6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color:
                                        AppColors.grey_808080), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.red_FF5151), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
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
                                  'Giá bán',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontFamily.medium,
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: productsController
                                        .priceUpdateController,
                                    decoration: InputDecoration(
                                      hintText: productsController
                                          .resultProducts[
                                              productsController.indexProduct]
                                          .price
                                          .toString(),
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
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Giá vốn',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontFamily.medium,
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    controller: productsController
                                        .importPriceUpdateController,
                                    decoration: InputDecoration(
                                      hintText: productsController
                                          .resultProducts[
                                              productsController.indexProduct]
                                          .importPrice
                                          .toString(),
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
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width - 20,
                        //   child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Tồn kho',
                        //           style: TextStyle(
                        //             fontSize: 16,
                        //             fontWeight: FontFamily.medium,
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           height: 45,
                        //           child: TextFormField(
                        //             controller: productsController
                        //                 .inventoryNumberUpdateController,
                        //             decoration: InputDecoration(
                        //               hintText: productsController
                        //                   .resultProducts[
                        //                       productsController.indexProduct]
                        //                   .inventoryNumber
                        //                   .toString(),
                        //               isDense: true,
                        //               enabledBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     width: 1,
                        //                     color: AppColors.grey_808080
                        //                         .withOpacity(
                        //                             0.6)), //<-- SEE HERE
                        //                 borderRadius:
                        //                     BorderRadius.circular(10.0),
                        //               ),
                        //               border: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     width: 1,
                        //                     color: AppColors
                        //                         .grey_808080), //<-- SEE HERE
                        //                 borderRadius:
                        //                     BorderRadius.circular(10.0),
                        //               ),
                        //               errorBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     width: 1,
                        //                     color: AppColors
                        //                         .red_FF5151), //<-- SEE HERE
                        //                 borderRadius:
                        //                     BorderRadius.circular(10.0),
                        //               ),
                        //               focusedBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                     width: 1,
                        //                     color:
                        //                         AppColors.black), //<-- SEE HERE
                        //                 borderRadius:
                        //                     BorderRadius.circular(10.0),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ]),
                        // ),
                        SizedBox(
                          height: AppDimens.dimens_30,
                        ),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blue_028f76),
                              onPressed: () {
                                productsController.updateProduct(
                                    context,
                                    productsController
                                        .resultProducts[
                                            productsController.indexProduct]
                                        .productImage);
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

Future<void> _showAlertDialog(BuildContext context) {
  ProductsController productsController = context.read<ProductsController>();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Xóa sản phẩm ?'),
        content: Text('Bạn có chắc rằng muốn xóa sản phẩm ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              productsController.deleteProduct();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Xóa'),
          ),
        ],
      );
    },
  );
}
