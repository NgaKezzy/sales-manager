import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/header_center.dart';

class CreateADecreaseAdjustment extends StatelessWidget {
  const CreateADecreaseAdjustment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderCenter(txt_header: 'Tạo điều chỉnh giảm'),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height - 80,
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
                            backgroundColor: AppColors.red_FC0000),
                        onPressed: () {},
                        child: Text('Điều chỉnh giảm'),
                      ),
                    ),
                  )),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                width: MediaQuery.of(context).size.width,
                                color: AppColors.white,
                                child: Text(
                                  'Danh sách sản phẩm',
                                  style: TextStyle(
                                      fontWeight: FontFamily.medium,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                color: AppColors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemAddedProduct(),
                                    ItemAddedProduct(),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: AppDimens.dimens_10),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: AppColors.blue_028f76,
                                          ),
                                          Text(
                                            'Thêm sản phẩm',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontFamily.medium,
                                                color: AppColors.blue_028f76),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemAddedProduct extends StatelessWidget {
  const ItemAddedProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.dimens_70,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.grey_8A8A8A.withOpacity(0.5), width: 1))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: AppDimens.dimens_50,
            width: AppDimens.dimens_50,
            decoration: BoxDecoration(
                color: AppColors.pink_FF7AAD,
                borderRadius: BorderRadius.circular(5)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tai nghe',
                style: TextStyle(fontWeight: FontFamily.medium, fontSize: 15),
              ),
              Text(
                'SP0001',
                style: TextStyle(color: AppColors.grey_8A8A8A),
              )
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '180.000 ',
                style: TextStyle(fontWeight: FontFamily.medium, fontSize: 16),
              ),
              Text(
                '180.000 x 1',
                style: TextStyle(color: AppColors.grey_8A8A8A),
              )
            ],
          ),
        ],
      ),
    );
  }
}
