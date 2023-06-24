import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/screens/manager/controller/products_controller.dart';
import 'package:sales_manager/widgets/header_center.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    ProductsController productsController = context.read<ProductsController>();
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 20,
            child: SingleChildScrollView(
              child: Column(
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
                            height: 30,
                            child: TextField(
                              textCapitalization: TextCapitalization.sentences,
                            )),
                        SizedBox(
                          height: 20,
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
                                    height: 30,
                                    child: TextField(
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
                                    height: 30,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                    )),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(children: [
                                Text(
                                  'Tồn kho',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontFamily.medium,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                SizedBox(
                                    height: 30,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                    )),
                              ]),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(children: [
                                Text(
                                  'Mã sản phẩm',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontFamily.medium,
                                      color: AppColors.grey_8A8A8A),
                                ),
                                SizedBox(
                                    height: 30,
                                    child: TextField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    )),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green_006200),
                      onPressed: () {},
                      child: Text('Cập nhật'))))
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
            },
            child: Text('Xóa'),
          ),
        ],
      );
    },
  );
}
