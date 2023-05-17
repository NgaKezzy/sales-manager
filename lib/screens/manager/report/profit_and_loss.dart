import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';

import '../../../config/app_size.dart';

class ProfitAndLoss extends StatelessWidget {
  const ProfitAndLoss({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_8A8A8A.withOpacity(0.2),
      child: Column(
        children: [
          SizedBox(
            height: AppDimens.dimens_5,
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: AppDimens.dimens_70,
            color: AppColors.white,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: AppDimens.dimens_50,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: AppColors.grey_8A8A8A.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: AppDimens.dimens_40,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Hôm nay',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_13,
                            color: AppColors.green_55b135,
                            fontWeight: FontFamily.medium),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: AppDimens.dimens_40,
                      decoration: BoxDecoration(
                        color: AppColors.green_7ab317,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Tháng này',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_13,
                            color: AppColors.black,
                            fontWeight: FontFamily.medium),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: AppDimens.dimens_40,
                      decoration: BoxDecoration(
                        color: AppColors.red_FF5151,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Tháng trước',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_13,
                            color: AppColors.black,
                            fontWeight: FontFamily.medium),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            width: MediaQuery.of(context).size.width,
            height: AppDimens.dimens_110,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: AppDimens.dimens_100,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          size: 20,
                          color: AppColors.yellow_FAA810,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Lợi nhuận',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_16,
                              fontWeight: FontFamily.medium),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '900.000',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_30,
                              color: AppColors.green_55b135,
                              fontWeight: FontFamily.semiBold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'đ',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_30,
                              color: AppColors.green_55b135,
                              fontWeight: FontFamily.semiBold),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: AppColors.grey_8A8A8A,
                      offset: Offset(0, 2))
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Chi tiết báo cáo',
                style: TextStyle(
                  fontSize: AppDimens.dimens_16,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: AppDimens.dimens_280,
                decoration: BoxDecoration(
                    color: AppColors.grey_8A8A8A.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Doanh thu",
                          style: TextStyle(fontSize: AppDimens.dimens_16),
                        ),
                        Text(
                          "500.000",
                          style: TextStyle(
                              fontSize: AppDimens.dimens_16,
                              color: AppColors.green_55b135),
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.grey_8A8A8A,
                      thickness: AppDimens.dimens_1,
                      height: AppDimens.dimens_20,
                    ),
                    Container(
                      height: AppDimens.dimens_210,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ItemProfitAndLossStatement(
                              txt: 'Tổng giá bán', number: '60000'),
                          ItemProfitAndLossStatement(
                              txt: 'Thu phí vận chuyển', number: '20.000'),
                          ItemProfitAndLossStatement(
                              txt: 'Khuyến mãi', number: '0'),
                          ItemProfitAndLossStatement(
                              txt: 'Chiết khấu', number: '0'),
                          ItemProfitAndLossStatement(
                              txt: 'Trả hàng', number: '0'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.grey_8A8A8A.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Giá vốn hàng bán',
                      style: TextStyle(fontSize: AppDimens.dimens_16),
                    ),
                    Text(
                      '480.000',
                      style: TextStyle(
                          fontSize: AppDimens.dimens_16,
                          color: AppColors.red_FC0000),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          // Container(
          //   height: 90,
          //   width: MediaQuery.of(context).size.width,
          //   color: AppColors.white,
          // )
        ],
      ),
    );
  }
}

class ItemProfitAndLossStatement extends StatelessWidget {
  const ItemProfitAndLossStatement({
    required this.txt,
    required this.number,
    super.key,
  });

  final String txt;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(fontSize: AppDimens.dimens_16),
        ),
        Text(
          number,
          style: TextStyle(fontSize: AppDimens.dimens_16),
        ),
      ],
    );
  }
}
