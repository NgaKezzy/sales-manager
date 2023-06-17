import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManagerController extends ChangeNotifier {
  String dateOrder = DateFormat(
    'dd/MM/yyyy',
  ).format(DateTime.now());

  void setDateTimeOrder(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) => {dateOrder = value.toString().split(' ')[0]});
  }
}
