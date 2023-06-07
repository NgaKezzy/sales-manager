import 'package:flutter/material.dart';
import 'package:sales_manager/config/app_color.dart';

class DataApp extends ChangeNotifier {
  Color chooseTime = AppColors.white;
  bool day = false;
  bool thisMonth = true;
  bool lastMonth = false;

  void changeColorThisMonth() {
    day = false;
    thisMonth = true;
    lastMonth = false;
    notifyListeners();
  }

  void changeColorDay() {
    day = true;
    thisMonth = false;
    lastMonth = false;
    notifyListeners();
  }

  void changeColorLastMonth() {
    day = false;
    thisMonth = false;
    lastMonth = true;
    notifyListeners();
  }
}
