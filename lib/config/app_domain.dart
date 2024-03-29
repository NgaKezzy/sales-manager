// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppDomains {
  AppDomains._();

  // static const String BASE_URL = 'streamvideo-dev.onrender.com';

  static const String BASE_URL = '192.168.0.101:3000';
  // static const String BASE_URL = 'localhost\:3000';
  static const String AUTH_LOGIN = '/auth/login';
  static const String AUTH_REGISTER = '/auth/register';
  static const String ACCESS_TOKEN = 'access_token';
  static const String REFRESH_TOKEN = 'refresh_token';
  static const String WAREHOUSE = '/warehouse/';
  static const String DELETE = '/warehouse/delete';
  static const String UPDATE_PRODUCT = '/warehouse/modifier';
  static const String ORDER = '/order';
  static const String GET_ORDER = '/order/';
  static const String GET_DETAIL_ORDER = '/order/order-details/';
  static const String DELETE_ORDER = '/order/delete';
  static const String CREATE_SPENDINGS = '/revenue';
  static const String GET_LIST_SPENDING = '/revenue/';
  static const String DELETE_SPENDING = '/revenue/delete';
  static const String UPDATE_SPENDING = '/revenue/modifier';
  static const String UPDATE_STORE_INFORMATION = '/user/shop';
  static const String GET_STATISTICAL = '/warehouse/statistic';

  static const String ID_WAREHOUSE = 'id_warehouse';
  static const String ID_User = 'id_user';
}
