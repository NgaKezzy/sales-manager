import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/spending/controller/spending_controller.dart';
import 'package:sales_manager/screens/spending/spending_screen.dart';

import '../../config/app.font.dart';
import '../../config/app_color.dart';
import '../../config/app_size.dart';
import 'day_trading.dart';

class RevenueAndExpenditureContent extends StatefulWidget {
  const RevenueAndExpenditureContent({super.key});

  @override
  State<RevenueAndExpenditureContent> createState() =>
      _RevenueAndExpenditureContentState();
}

class _RevenueAndExpenditureContentState
    extends State<RevenueAndExpenditureContent> {
  late SpendingController spendingController;
  @override
  void didChangeDependencies() {
    spendingController = context.read<SpendingController>();

    spendingController.getListSpendings();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SpendingController spendingController = context.read<SpendingController>();

    context
        .watch<SpendingController>()
        .listSpending[spendingController.indexSpending];

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
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
                          color: AppColors.grey_8A8A8A.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
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
        Expanded(
            child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 60),
          itemCount: spendingController.listSpending.length,
          itemBuilder: (context, index) {
            return DayTrading(
              item: index,
            );
          },
        ))
      ],
    );
  }
}
