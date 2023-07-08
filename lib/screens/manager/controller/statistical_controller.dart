import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_manager/config/print_color.dart';
import 'package:sales_manager/models/statistical_model.dart';
import 'package:sales_manager/network/fetch_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_domain.dart';

class StatisticalController extends ChangeNotifier {
  String timeFirst = '';
  String timeEnd = '';
  Statistical? resultStatisticalDateNow;
  Statistical? resultStatisticalLastMonth;
  Statistical? resultStatisticalThisMonth;

  var dateNow = DateTime.utc(
          DateTime.now().year, DateTime.now().month, DateTime.now().day)
      .toString()
      .split(' ')[0];

  var lastMonth = DateTime.utc(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .split(' ')[0];

  var thisMonth = DateTime.utc(DateTime.now().year, DateTime.now().month)
      .toString()
      .split(' ')[0];
  String lastDay = '-1';
  String endDay = '-31';

  void getStatisticalDateNow() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final getStatistical =
        await NetworkApi.getStatistical(idWarehouse ?? '', dateNow, dateNow);
    if (getStatistical['status'] == 'success') {
      Statistical dataStatisticalDateNow =
          Statistical.fromJson(getStatistical['data']);

      resultStatisticalDateNow = dataStatisticalDateNow;
    }
  }

  void getStatisticalLastMonth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final getStatistical = await NetworkApi.getStatistical(
        idWarehouse ?? '', '$lastMonth+$lastDay', '$lastMonth+$endDay');
    if (getStatistical['status'] == 'success') {
      Statistical dataStatisticalLastMonth =
          Statistical.fromJson(getStatistical['data']);
      resultStatisticalLastMonth = dataStatisticalLastMonth;

      printRed(resultStatisticalDateNow!.totalPriceWareHouse.toString());
    }
  }

  void getStatisticalThisMonth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final getStatistical = await NetworkApi.getStatistical(
        idWarehouse ?? '', '$thisMonth+$lastDay', '$thisMonth+$endDay');
    if (getStatistical['status'] == 'success') {
      Statistical datatStatisticalThisMonth =
          Statistical.fromJson(getStatistical['data']);

      resultStatisticalThisMonth = datatStatisticalThisMonth;
    }
  }
}
