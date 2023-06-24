import 'package:flutter/material.dart';

class WarehouseReportController extends ChangeNotifier {
  String _check = 'warehouse value';

  String get check => _check;

  void setCheck(String value) {
    _check = value;
    notifyListeners();
  }
}
