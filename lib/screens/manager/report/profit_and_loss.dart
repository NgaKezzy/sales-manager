import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_color.dart';
import 'package:sales_manager/models/data_app.dart';
import 'package:sales_manager/screens/manager/report/profit_and_loss_content.dart';

import '../../../config/app_size.dart';
import '../controller/statistical_controller.dart';

class ProfitAndLoss extends StatefulWidget {
  const ProfitAndLoss({super.key});

  @override
  State<ProfitAndLoss> createState() => _ProfitAndLossState();
}

class _ProfitAndLossState extends State<ProfitAndLoss> {
  late final PageController _controller;
  late StatisticalController statisticalController;
  int x = 0;
  int y = 0;
  int z = 0;
  int a = 0;

  void didChangeDependencies() {
    statisticalController = context.read<StatisticalController>();
    statisticalController.getStatisticalDateNow();
    statisticalController.getStatisticalThisMonth();
    statisticalController.getStatisticalLastMonth();

    statisticalController.resultStatisticalDateNow == null
        ? x = 0
        : x = statisticalController.resultStatisticalDateNow!.loiNhuan;
    statisticalController.resultStatisticalDateNow == null
        ? a = 0
        : a = statisticalController.resultStatisticalDateNow!.totalPrice;

    statisticalController.resultStatisticalDateNow == null
        ? y = 0
        : y = statisticalController.resultStatisticalThisMonth!.loiNhuan;
    statisticalController.resultStatisticalDateNow == null
        ? z = 0
        : z = statisticalController.resultStatisticalLastMonth!.loiNhuan;

    super.didChangeDependencies();
  }

  int _index = 0;
  @override
  void initState() {
    _controller = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

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
            height: AppDimens.dimens_60,
            color: AppColors.white,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: AppDimens.dimens_40,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.grey_8A8A8A.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.animateToPage(
                          0,
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: AppDimens.dimens_30,
                        decoration: BoxDecoration(
                          color: _index == 0
                              ? AppColors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Hôm nay',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_13,
                              color: _index == 0
                                  ? AppColors.blue_028f76
                                  : AppColors.black,
                              fontWeight: FontFamily.medium),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.animateToPage(
                          1,
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: AppDimens.dimens_30,
                        decoration: BoxDecoration(
                          color: _index == 1
                              ? AppColors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Tháng này',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_13,
                              color: _index == 1
                                  ? AppColors.blue_028f76
                                  : AppColors.black,
                              fontWeight: FontFamily.medium),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.animateToPage(
                          2,
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: AppDimens.dimens_30,
                        decoration: BoxDecoration(
                          color: _index == 2
                              ? AppColors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Tháng trước',
                          style: TextStyle(
                              fontSize: AppDimens.dimens_13,
                              color: _index == 2
                                  ? AppColors.blue_028f76
                                  : AppColors.black,
                              fontWeight: FontFamily.medium),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) => setState(() {
                _index = index;
              }),
              children: [
                ProfitAndLossContent(
                  item: _index,
                  money: x,
                  doanhthu: a,
                ),
                ProfitAndLossContent(
                  item: _index,
                  money: y,
                  doanhthu: a,
                ),
                ProfitAndLossContent(
                  item: _index,
                  money: z,
                  doanhthu: a,
                ),
              ],
            ),
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
