class UpdateStoreInformation {
  String idUser;
  String shopName;
  String address;
  String description;
  String phone;

  UpdateStoreInformation(
      {required this.idUser,
      required this.shopName,
      required this.address,
      required this.description,
      required this.phone});

  factory UpdateStoreInformation.fromJson(Map<String, dynamic> json) {
    return UpdateStoreInformation(
        idUser: json['idUser'],
        shopName: json['shopName'],
        address: json['address'],
        description: json['description'],
        phone: json['phone']);
  }
}
