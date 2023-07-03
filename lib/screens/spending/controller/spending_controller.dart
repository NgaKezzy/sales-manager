import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_domain.dart';
import '../../../config/print_color.dart';
import '../../../models/revenue_expenditure_model.dart';
import '../../../network/fetch_api.dart';

class SpendingController extends ChangeNotifier {
  List<RevenueExpenditure> listSpending = [];
  String revenueFund = 'Tiền mặt';
  var revenueMoneyController = TextEditingController();
  var revenueNoteController = TextEditingController();
  var expendingMoneyController = TextEditingController();
  var expendingNoteController = TextEditingController();

  String dateRevenue = DateFormat(
    'dd/MM/yyyy',
  ).format(DateTime.now());

  String dateExpenses = DateFormat(
    'dd/MM/yyyy',
  ).format(DateTime.now());

  void setDateTimeRevenue(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) => {dateRevenue = value.toString().split(' ')[0]});
  }

  void setDateTimeExpenses(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) => {dateExpenses = value.toString().split(' ')[0]});
  }

  void createdExpending() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final expendingMoney = expendingMoneyController.text;
    final expendingNote = expendingNoteController.text;

    final createdSpending = await NetworkApi.createSpendings(
        idWarehouse.toString(),
        idWarehouse.toString(),
        dateRevenue,
        revenueFund,
        expendingMoney,
        expendingNote,
        'X');
    if (createdSpending['status'] == 'success') {
      Fluttertoast.showToast(msg: '${createdSpending['message']}');
      expendingMoneyController.text = '';
      expendingNoteController.text = '';
    } else {
      Fluttertoast.showToast(msg: '${createdSpending['message']}');
    }

    notifyListeners();
  }

  void getListSpendings() async {
    final getDataSpending = await NetworkApi.getListSpendings();

    final List<RevenueExpenditure> dataSpending =
        RevenueExpenditure.convertToList(getDataSpending['message']);
    listSpending = dataSpending;
    printRed('số lượng khoản thu chi ${listSpending.length}');

    notifyListeners();
  }
}
