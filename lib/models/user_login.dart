import 'package:flutter/material.dart';

class UserLogin {
  String username;
  String avatar;
  String fullname;
  String address;

  UserLogin(
      {required this.username,
      required this.avatar,
      required this.fullname,
      required this.address});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        username: json['username'],
        avatar: json["avatar"],
        fullname: json['fullname'],
        address: json['address']);
  }

  // static List<UserLogin> convertToListPost(List<dynamic> json) {
  //   //json ở đây là data
  //   return json.map<UserLogin>((user) => UserLogin.fromJson(user)).toList();
  //   // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  // }
}
