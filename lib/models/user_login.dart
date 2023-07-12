class UserLogin {
  String userId;
  String username;
  String avatar;
  String fullname;
  String address;
  String idWarehouse;
  String shopName;
  String phone;
  String description;

  UserLogin(
      {required this.userId,
      required this.username,
      required this.avatar,
      required this.fullname,
      required this.address,
      required this.idWarehouse,
      required this.shopName,
      required this.phone,
      required this.description});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        userId: json["userId"],
        username: json['username'],
        avatar: json["avatar"],
        fullname: json['fullname'],
        address: json['address'],
        idWarehouse: json['idWarehouse'],
        shopName: json['shopName'],
        phone: json['phone'],
        description: json['description']);
  }

  // static List<UserLogin> convertToListPost(List<dynamic> json) {
  //   //json ở đây là data
  //   return json.map<UserLogin>((user) => UserLogin.formJson(user)).toList();
  //   // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  // }
}
