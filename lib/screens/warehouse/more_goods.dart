import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/widgets/header_center.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import 'create_import_goods.dart';

class MoreGoods extends StatelessWidget {
  const MoreGoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Nhập hàng'),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green_006200),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateImportGoods()));
                      },
                      child: Text('Tiếp tục'),
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: MediaQuery.of(context).size.height - 80,
                  child: Column(
                    children: [
                      ItemMoreGoods(),
                      ItemMoreGoods(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemMoreGoods extends StatelessWidget {
  const ItemMoreGoods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
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
                'Tai nghe',
                style: TextStyle(fontSize: 15, fontWeight: FontFamily.medium),
              ),
              Row(
                children: [
                  Text(
                    'SP00011',
                    style: TextStyle(color: AppColors.grey_8A8A8A),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: AppDimens.dimens_20,
                    width: 1,
                    color: AppColors.grey_8A8A8A,
                  ),
                  Text(
                    'Còn: 180',
                    style: TextStyle(color: AppColors.grey_8A8A8A),
                  ),
                ],
              )
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: AppColors.grey_8A8A8A.withOpacity(0.6), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.remove,
                        color: AppColors.black,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.add),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
