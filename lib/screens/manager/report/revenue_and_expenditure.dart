import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_size.dart';

import '../../../config/app_color.dart';

class RevenueAndExpenditure extends StatelessWidget {
  const RevenueAndExpenditure({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: AppColors.grey_8A8A8A.withOpacity(0.2),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: AppDimens.dimens_150,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: AppDimens.dimens_40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: AppColors.grey_8A8A8A))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 24,
                            color: AppColors.grey_8A8A8A,
                          ),
                          Text(
                            'Tháng này',
                            style: TextStyle(
                                fontSize: AppDimens.dimens_16,
                                color: AppColors.grey_8A8A8A),
                          ),
                          Icon(
                            Icons.expand_more,
                            size: AppDimens.dimens_24,
                            color: AppColors.grey_8A8A8A,
                          )
                        ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: AppDimens.dimens_100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tổng thu',
                            style: TextStyle(
                                color: AppColors.grey_8A8A8A,
                                fontSize: AppDimens.dimens_15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '64.452.000',
                                style: TextStyle(
                                    color: AppColors.green_55b135,
                                    fontSize: AppDimens.dimens_18,
                                    fontWeight: FontFamily.semiBold),
                              ),
                              Text(
                                '  đ',
                                style: TextStyle(
                                    color: AppColors.green_55b135,
                                    fontSize: AppDimens.dimens_18,
                                    fontWeight: FontFamily.semiBold),
                              ),
                            ],
                          ),
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width * 0.35,
                            color: AppColors.green_55b135,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: AppDimens.dimens_60,
                      width: AppDimens.dimens_1,
                      color: AppColors.grey_8A8A8A,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: AppDimens.dimens_100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tổng chi',
                              style: TextStyle(
                                  color: AppColors.grey_8A8A8A,
                                  fontSize: AppDimens.dimens_15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '64.452.000',
                                  style: TextStyle(
                                      color: AppColors.violet_ac4147,
                                      fontSize: AppDimens.dimens_18,
                                      fontWeight: FontFamily.semiBold),
                                ),
                                Text(
                                  '  đ',
                                  style: TextStyle(
                                      color: AppColors.violet_ac4147,
                                      fontSize: AppDimens.dimens_18,
                                      fontWeight: FontFamily.semiBold),
                                ),
                              ],
                            ),
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.35,
                              color: AppColors.violet_ac4147,
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
