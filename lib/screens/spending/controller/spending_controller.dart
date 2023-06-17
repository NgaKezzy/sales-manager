import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SpendingController extends ChangeNotifier {
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
}
