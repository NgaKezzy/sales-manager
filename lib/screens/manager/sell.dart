import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/add_product.dart';

import '../../config/app.font.dart';
import '../../widgets/item_list_product.dart';

// màn bán hàng

class Sell extends StatelessWidget {
  const Sell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: AppDimens.dimens_120,
              color: AppColors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: AppDimens.dimens_50,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Icon(Icons.arrow_back_ios),
                              SizedBox(
                                width: AppDimens.dimens_10,
                              ),
                              Text(
                                'Bán hàng',
                                style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: FontFamily.medium,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: AppDimens.dimens_45,
                    width: MediaQuery.of(context).size.width,
                    child: const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.black,
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Tìm theo tên sản phẩm',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: AppColors.grey_8A8A8A.withOpacity(0.3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemListProduct(),
                        ItemListProduct(),
                        AddProduct()
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
