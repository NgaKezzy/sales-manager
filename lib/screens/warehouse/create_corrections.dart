import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/widgets/header_center.dart';

import 'create_a_decrease_adjustment.dart';

class CreateCorrections extends StatelessWidget {
  const CreateCorrections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            HeaderCenter(txt_header: 'Chọn sản phẩm giảm'),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: double.infinity,
                      // color: Colors.red,
                      child: Container(
                          height: AppDimens.dimens_40,
                          width: MediaQuery.of(context).size.width * 0.8,
                          // color: AppColors.black,
                          margin: EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.green_006200),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateADecreaseAdjustment()));
                              },
                              child: Text('Tiếp tục'))),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ItemSelectProduct(),
                        ItemSelectProduct(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemSelectProduct extends StatelessWidget {
  const ItemSelectProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: AppDimens.dimens_100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
              top: BorderSide(
                  color: AppColors.grey_8A8A8A.withOpacity(0.5),
                  width: AppDimens.dimens_1))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: AppDimens.dimens_80,
            width: AppDimens.dimens_80,
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
              Text(
                'SP00011',
                style: TextStyle(color: AppColors.grey_8A8A8A),
              )
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Tồn kho: 13',
                style: TextStyle(color: AppColors.grey_8A8A8A),
              ),
              Container(
                height: AppDimens.dimens_40,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: AppDimens.dimens_26,
                        width: AppDimens.dimens_26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColors.blue_028f76,
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 16,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: AppDimens.dimens_10),
                      height: AppDimens.dimens_25,
                      width: AppDimens.dimens_50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: AppColors.grey_8A8A8A, width: 1)),
                      child: Text(
                        '1',
                        style: TextStyle(color: AppColors.grey_8A8A8A),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: AppDimens.dimens_26,
                        width: AppDimens.dimens_26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColors.blue_028f76,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
