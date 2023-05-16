import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/add_product.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';

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
            Column(
              children: [
                HeaderCenter(txt_header: 'Bán hàng'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: AppDimens.dimens_45,
                  width: MediaQuery.of(context).size.width,
                  child: const TextField(
                    textAlignVertical: TextAlignVertical(y: 0.9),
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
                        AddProduct(),
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

class ItemListProduct extends StatelessWidget {
  const ItemListProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
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
            'Còn: 100',
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
                  'Loa ',
                  style: TextStyle(
                      fontSize: 13,
                      color: AppColors.black,
                      fontWeight: FontFamily.medium,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  '600.000',
                  style: TextStyle(
                      fontSize: 13,
                      color: AppColors.black,
                      fontWeight: FontFamily.medium),
                ),
              ]),
        )
      ]),
    );
  }
}
