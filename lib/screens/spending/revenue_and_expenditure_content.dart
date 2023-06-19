import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/screens/spending/spending_screen.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import '../warehouse/day_tra_ding.dart';

class RevenueAndExpenditureContent extends StatelessWidget {
  const RevenueAndExpenditureContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Số dư : ',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_16,
                        fontWeight: FontFamily.medium),
                  ),
                  Text(
                    '61.524.000',
                    style: TextStyle(
                        color: AppColors.green_55b135,
                        fontSize: AppDimens.dimens_16,
                        fontWeight: FontFamily.medium),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: AppDimens.dimens_60,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: AppColors.grey_8A8A8A.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Tổng chi',
                            style: TextStyle(
                                color: AppColors.grey_8A8A8A,
                                fontSize: AppDimens.dimens_16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1.250.000 ',
                                style: TextStyle(
                                    color: AppColors.red_FC0000,
                                    fontWeight: FontFamily.semiBold,
                                    fontSize: AppDimens.dimens_16),
                              ),
                              Text(
                                ' đ',
                                style: TextStyle(
                                    color: AppColors.red_FC0000,
                                    fontWeight: FontFamily.semiBold,
                                    fontSize: AppDimens.dimens_16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: AppDimens.dimens_60,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: AppColors.grey_8A8A8A.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Tổng thu',
                            style: TextStyle(
                                color: AppColors.grey_8A8A8A,
                                fontSize: AppDimens.dimens_16),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1.250.000 ',
                                style: TextStyle(
                                    color: AppColors.green_55b135,
                                    fontWeight: FontFamily.semiBold,
                                    fontSize: AppDimens.dimens_16),
                              ),
                              Text(
                                ' đ',
                                style: TextStyle(
                                    color: AppColors.green_55b135,
                                    fontWeight: FontFamily.semiBold,
                                    fontSize: AppDimens.dimens_16),
                              ),
                            ],
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
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              DayTrading(),
              DayTrading(),
              DayTrading(),
              DayTrading(),
              DayTrading(),
              DayTrading(),
              DayTrading(),
              DayTrading(),
              DayTrading(),
              DayTrading(),
              SizedBox(
                height: AppDimens.dimens_50,
              )
            ]),
          ),
        )
      ],
    );
  }
}
