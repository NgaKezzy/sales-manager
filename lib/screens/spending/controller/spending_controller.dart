import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/app_domain.dart';
import '../../../config/print_color.dart';
import '../../../models/get_spending_model.dart';
import '../../../models/revenue_expenditure_model.dart';
import '../../../network/fetch_api.dart';

class SpendingController extends ChangeNotifier {
  int indexSpending = 0;
  List<GetSpending> listSpending = [];
  String idSpending = '';
  String revenueFund = 'Tiền mặt';
  String fundUpdate = '';
  String idSpendingUpdate = '';

  var revenueMoneyController = TextEditingController();
  var revenueNoteController = TextEditingController();
  var expendingMoneyController = TextEditingController();
  var expendingNoteController = TextEditingController();
  var moneyUpdateCOntroller = TextEditingController();
  var noteUpdateController = TextEditingController();

  String dateRevenue = DateFormat(
    'dd/MM/yyyy',
  ).format(DateTime.now());

  String dateExpenses = DateFormat(
    'dd/MM/yyyy',
  ).format(DateTime.now());

  String dateUpdate = DateFormat(
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

  void setDateTimeUpdate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) => {dateUpdate = value.toString().split(' ')[0]});
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
        'N');
    if (createdSpending['status'] == 'success') {
      Fluttertoast.showToast(msg: '${createdSpending['message']}');
      expendingMoneyController.text = '';
      expendingNoteController.text = '';
    } else {
      Fluttertoast.showToast(msg: '${createdSpending['message']}');
    }

    notifyListeners();
  }

  void createRevenue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final idWarehouse = prefs.getString(AppDomains.ID_WAREHOUSE);

    final revenueMoney = revenueMoneyController.text;
    final revenueNote = revenueNoteController.text;

    final createdSpending = await NetworkApi.createSpendings(
        idWarehouse.toString(),
        idWarehouse.toString(),
        dateRevenue,
        revenueFund,
        revenueMoney,
        revenueNote,
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

    final List<GetSpending> dataSpending =
        GetSpending.convertToList(getDataSpending['message']);
    listSpending = dataSpending;
    printRed('số lượng khoản thu chi ${listSpending.length}');

    notifyListeners();
  }

  void deleteSpending(String idSpending) async {
    final deleteSpending = await NetworkApi.deleteSpendings(idSpending);
    if (deleteSpending['status'] == 'success') {
      Fluttertoast.showToast(msg: '${deleteSpending['message']}');
      getListSpendings();
    } else {
      Fluttertoast.showToast(msg: '${deleteSpending['message']}');
    }
    notifyListeners();
  }

  void updateSpending() async {
    final moneyUpdate = moneyUpdateCOntroller.text;
    final noteUpdate = noteUpdateController.text;
    final updateSpending = await NetworkApi.updateSpendings(
        idSpending,
        dateUpdate,
        fundUpdate,
        moneyUpdate,
        noteUpdate,
        listSpending[indexSpending].type == 1 ? 'N' : 'X');

    if (updateSpending['status'] == 'success') {
      getListSpendings();
      Fluttertoast.showToast(msg: '${updateSpending['message']}');
    } else {
      Fluttertoast.showToast(msg: '${updateSpending['message']}');
    }
  }
}
