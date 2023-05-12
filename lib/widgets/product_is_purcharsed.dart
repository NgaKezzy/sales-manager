import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/app.font.dart';
import '../config/app_color.dart';
import '../config/app_size.dart';

class ProductIsPurcharsed extends StatelessWidget {
  const ProductIsPurcharsed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_90,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(width: 1, color: AppColors.grey_8A8A8A)),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: AppDimens.dimens_70,
                height: AppDimens.dimens_70,
                color: AppColors.pink_FA4881,
              ),
              Positioned(
                  top: -7,
                  left: -7,
                  child: Container(
                    alignment: Alignment.center,
                    height: AppDimens.dimens_20,
                    width: AppDimens.dimens_20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.grey_8A8A8A),
                    child: Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 15,
                    ),
                  ))
            ],
          ),
          SizedBox(
            width: AppDimens.dimens_10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: TextStyle(
                    fontSize: AppDimens.dimens_15,
                    overflow: TextOverflow.ellipsis),
              ),
              Container(
                width: AppDimens.dimens_100,
                height: AppDimens.dimens_35,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey_8A8A8A),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppDimens.dimens_33,
                      height: AppDimens.dimens_35,
                      child: Icon(
                        Icons.remove,
                        size: 20,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.black,
                          fontWeight: FontFamily.medium),
                    ),
                    SizedBox(
                      width: AppDimens.dimens_33,
                      height: AppDimens.dimens_35,
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomRight,
            child: Text(
              '300.000',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontFamily.medium,
                  color: AppColors.red_FC0000),
            ),
          ))
        ],
      ),
    );
  }
}
