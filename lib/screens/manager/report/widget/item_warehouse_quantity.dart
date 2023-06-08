import 'package:flutter/material.dart';

import '../../../../config/app.font.dart';
import '../../../../config/app_color.dart';
import '../../../../config/app_size.dart';

class ItemWarehouseQuantity extends StatelessWidget {
  const ItemWarehouseQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: MediaQuery.of(context).size.width,
      height: AppDimens.dimens_80,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '1',
                style: TextStyle(
                    fontWeight: FontFamily.medium,
                    fontSize: AppDimens.dimens_16,
                    color: AppColors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.grey_A49797),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loa',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            fontWeight: FontFamily.medium),
                      ),
                      Text(
                        '52',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.red_FC0000,
                            fontWeight: FontFamily.medium),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mã : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        'SP0001',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'GT : ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      ),
                      Text(
                        '50.254.165',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.grey_8A8A8A),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.grey_8A8A8A,
          )
        ],
      ),
    );
  }
}
