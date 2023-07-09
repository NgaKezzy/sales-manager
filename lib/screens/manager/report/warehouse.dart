import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_manager/config/app.font.dart';
import 'package:sales_manager/config/app_size.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/screens/manager/controller/statistical_controller.dart';
import 'package:sales_manager/screens/manager/report/widget/product_is_out.dart';
import 'package:sales_manager/screens/manager/report/widget/quantity.dart';
import 'package:sales_manager/screens/manager/report/widget/remaing_product.dart';
import 'package:sales_manager/screens/manager/report/widget/ware_hourse_value.dart';
import '../../../config/app_color.dart';
import '../controller/warehouse_report_controller.dart';

class Warehouse extends StatefulWidget {
  Warehouse({super.key});

  @override
  State<Warehouse> createState() => _WarehouseState();
}

class _WarehouseState extends State<Warehouse> {
  late StatisticalController statisticalController;

  void didChangeDependencies() {
    statisticalController = context.read<StatisticalController>();

    statisticalController.getStatisticalDateNow();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WarehouseReportController(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimens_10,
          vertical: AppDimens.dimens_10,
        ),
        color: AppColors.grey_8A8A8A.withOpacity(0.2),
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Column(
          children: [
            HeaderWarehouseReport(),
            SizedBox(
              height: 10,
            ),
            ContentWarehouseReport(),
          ],
        ),
      ),
    );
  }
}

class HeaderWarehouseReport extends StatefulWidget {
  const HeaderWarehouseReport({super.key});

  @override
  State<HeaderWarehouseReport> createState() => _HeaderWarehouseReportState();
}

class _HeaderWarehouseReportState extends State<HeaderWarehouseReport> {
  @override
  Widget build(BuildContext context) {
    WarehouseReportController warehouseReportController =
        context.read<WarehouseReportController>();

    StatisticalController statisticalController =
        context.read<StatisticalController>();

    return Container(
      padding: EdgeInsets.all(10),
      height: AppDimens.dimens_260,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  warehouseReportController.setCheck('warehouse value');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: AppDimens.dimens_100,
                  width: MediaQuery.of(context).size.width * 0.43,
                  decoration: BoxDecoration(
                    color: AppColors.grey_8A8A8A.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/money.svg',
                          height: 25, color: AppColors.green_55b135),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          statisticalController.resultStatisticalDateNow == null
                              ? Text(
                                  '0 đ',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_18,
                                      fontWeight: FontFamily.semiBold),
                                )
                              : Text(
                                  '${NumberFormat.decimalPattern().format(statisticalController.resultStatisticalDateNow!.totalPriceWareHouse)} đ',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_18,
                                      fontWeight: FontFamily.semiBold),
                                ),
                        ],
                      ),
                      Text(
                        'Giá trị kho',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_12,
                            color: AppColors.grey_8A8A8A),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  warehouseReportController.setCheck('quantity');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: AppDimens.dimens_100,
                  width: MediaQuery.of(context).size.width * 0.43,
                  decoration: BoxDecoration(
                    color: AppColors.grey_8A8A8A.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/container.svg',
                          height: 25, color: AppColors.red_FF5151),
                      statisticalController.resultStatisticalDateNow == null
                          ? Text(
                              '0 ',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: FontFamily.semiBold),
                            )
                          : Text(
                              '${statisticalController.resultStatisticalDateNow!.slProduct}',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: FontFamily.semiBold),
                            ),
                      Text(
                        'Số lượng',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_12,
                            color: AppColors.grey_8A8A8A),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  warehouseReportController.setCheck('remaining products');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: AppDimens.dimens_100,
                  width: MediaQuery.of(context).size.width * 0.43,
                  decoration: BoxDecoration(
                    color: AppColors.grey_8A8A8A.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/cart-check.svg',
                          height: 25, color: AppColors.blue_0000ff),
                      statisticalController.resultStatisticalDateNow == null
                          ? Text(
                              '0 ',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: FontFamily.semiBold),
                            )
                          : Text(
                              '${statisticalController.resultStatisticalDateNow!.slProduct}',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: FontFamily.semiBold),
                            ),
                      Text(
                        'Sản phẩm còn bán',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_12,
                            color: AppColors.grey_8A8A8A),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  warehouseReportController.setCheck('product is out');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: AppDimens.dimens_100,
                  width: MediaQuery.of(context).size.width * 0.43,
                  decoration: BoxDecoration(
                    color: AppColors.grey_8A8A8A.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/cart-close.svg',
                          height: 25, color: AppColors.red_d31900),
                      statisticalController.resultStatisticalDateNow == null
                          ? Text(
                              '0 ',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: FontFamily.semiBold),
                            )
                          : Text(
                              '${statisticalController.resultStatisticalDateNow!.sProductEmpty}',
                              style: TextStyle(
                                  fontSize: AppDimens.dimens_18,
                                  fontWeight: FontFamily.semiBold),
                            ),
                      Text(
                        'Sản phẩm hết hàng',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_12,
                            color: AppColors.grey_8A8A8A),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContentWarehouseReport extends StatelessWidget {
  const ContentWarehouseReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WarehouseReportController>(
      builder: (context, value, child) {
        Widget item = const SizedBox();
        switch (value.check) {
          case 'warehouse value':
            item = WarehouseValue();

            break;
          case 'quantity':
            item = WarehouseValue();
            break;
          case 'remaining products':
            item = WarehouseValue();
            break;
          case 'product is out':
            item = WarehouseValue();
            break;
          default:
        }
        return item;
      },
    );
  }
}
