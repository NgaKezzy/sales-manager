import 'package:flutter/material.dart';

class UserRegister {
  String username;
  String password;

  UserRegister({required this.username, required this.password});

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      username: json['username'],
      password: json["password"],
    );
  }
}
