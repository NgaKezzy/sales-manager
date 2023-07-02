// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppDomains {
  AppDomains._();
  static const String BASE_URL = 'streamvideo-dev.onrender.com';
  // static const String BASE_URL = '192.168.0.106\:3000';
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

  static const String ID_WAREHOUSE = 'id_warehouse';
}
