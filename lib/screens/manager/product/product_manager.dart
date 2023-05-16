import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_size.dart';

import '../../../config/app_color.dart';

class ProductManager extends StatelessWidget {
  const ProductManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_8A8A8A.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                    DisplayList(
                      nameDisplay: 'Điện tử',
                    ),
                    DisplayList(
                      nameDisplay: 'Dân dụng',
                    ),
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                    DisplayList(
                      nameDisplay: 'Tất cả',
                    ),
                  ],
                )
              ],
            ),
          ),
          ItemProductManager(),
          ItemProductManager(),
          ItemProductManager(),
          ItemProductManager(),
        ],
      ),
    );
  }
}

class ItemProductManager extends StatelessWidget {
  const ItemProductManager({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimens.dimens_10),
      height: AppDimens.dimens_80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: AppDimens.dimens_60,
            width: AppDimens.dimens_60,
            decoration: BoxDecoration(
                color: AppColors.green_006200,
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(
            width: AppDimens.dimens_15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Quạt',
                style: TextStyle(
                    fontSize: AppDimens.dimens_16,
                    fontWeight: FontFamily.medium),
              ),
              Text(
                'Có thể bán : 95',
                style: TextStyle(
                  fontSize: AppDimens.dimens_13,
                ),
              ),
              Text(
                '300.000',
                style: TextStyle(
                    fontSize: AppDimens.dimens_16,
                    fontWeight: FontFamily.medium,
                    color: AppColors.red_FC0000),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DisplayList extends StatelessWidget {
  const DisplayList({
    required this.nameDisplay,
    super.key,
  });

  final String nameDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      height: AppDimens.dimens_40,
      width: AppDimens.dimens_80,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.blue_0000ff.withOpacity(0.5),
            width: AppDimens.dimens_1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        nameDisplay,
        style: TextStyle(
            fontSize: AppDimens.dimens_13, color: AppColors.blue_0000ff),
      ),
    );
  }
}
