import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/report/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Scaffold(
      body: Form(
        key: productsController.keyCreateProduct,
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Tạo sản phẩm'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                              height: 50,
                              child: TextFormField(
                                controller:
                                    productsController.nameProdcutController,
                                validator: productsController.validator,
                                decoration: InputDecoration(isDense: true),
                                textAlign: TextAlign.center,
                                textCapitalization:
                                    TextCapitalization.sentences,
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(right: 10, left: 10),
                                width: MediaQuery.of(context).size.width - 20,
                                child: Column(children: [
                                  Text(
                                    'Số lượng',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontFamily.medium,
                                        color: AppColors.grey_8A8A8A),
                                  ),
                                  SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        controller: productsController
                                            .quantityProdcutController,
                                        decoration:
                                            InputDecoration(isDense: true),
                                        validator: productsController.validator,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(children: [
                                  Text(
                                    'Giá bán',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontFamily.medium,
                                        color: AppColors.grey_8A8A8A),
                                  ),
                                  SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        controller: productsController
                                            .priceProdcutController,
                                        decoration:
                                            InputDecoration(isDense: true),
                                        validator: productsController.validator,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      )),
                                ]),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(children: [
                                  Text(
                                    'Giá vốn',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontFamily.medium,
                                        color: AppColors.grey_8A8A8A),
                                  ),
                                  SizedBox(
                                      height: 50,
                                      child: TextFormField(
                                        decoration:
                                            InputDecoration(isDense: true),
                                        controller: productsController
                                            .importPriceProdcutController,
                                        validator: productsController.validator,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: AppDimens.dimens_30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.green_006200),
                                      onPressed: () =>
                                          productsController.createProduct(),
                                      child: Text('Tạo'))),
                            ],
                          )
                        ],
                      ),
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
