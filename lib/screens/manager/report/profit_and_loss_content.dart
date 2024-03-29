import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/screens/manager/report/profit_and_loss.dart';

import '../../../config/app.font.dart';
import '../../../config/app_color.dart';
import '../../../config/app_size.dart';
import '../controller/statistical_controller.dart';

class ProfitAndLossContent extends StatefulWidget {
  ProfitAndLossContent({
    required this.item,
    required this.money,
    required this.doanhthu,
    super.key,
  });
  int item;
  int money;
  int doanhthu;

  @override
  State<ProfitAndLossContent> createState() => _ProfitAndLossContentState();
}

class _ProfitAndLossContentState extends State<ProfitAndLossContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        ' ${NumberFormat.decimalPattern().format(widget.money)}',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_30,
                            color: AppColors.blue_028f76,
                            fontWeight: FontFamily.semiBold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'đ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_30,
                            color: AppColors.blue_028f76,
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
                        '${NumberFormat.decimalPattern().format(widget.doanhthu)} đ',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_16,
                            color: AppColors.blue_028f76),
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
                            txt: 'Thu phí vận chuyển', number: '0'),
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
                color: AppColors.grey_8A8A8A.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Giá vốn hàng bán',
                    style: TextStyle(fontSize: AppDimens.dimens_16),
                  ),
                  Text(
                   '${NumberFormat.decimalPattern().format(widget.doanhthu - widget.money)} đ',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_16,
                        color: AppColors.red_FC0000),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
