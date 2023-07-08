class Statistical {
  int slProduct;
  int totalPriceWareHouse;
  int slProductConBanDuoc;
  int sProductEmpty;
  int totalPrice;
  int importTotalPrice;
  int allTotal;

  Statistical(
      {required this.slProduct,
      required this.totalPriceWareHouse,
      required this.slProductConBanDuoc,
      required this.sProductEmpty,
      required this.totalPrice,
      required this.importTotalPrice,
      required this.allTotal});

  factory Statistical.fromJson(Map<String, dynamic> json) {
    return Statistical(
      slProduct: json['slProduct'],
      totalPriceWareHouse: json['totalPriceWareHouse'],
      slProductConBanDuoc: json['slProductConBanDuoc'],
      sProductEmpty: json['sProductEmpty'],
      totalPrice: json['totalPrice'],
      importTotalPrice: json['importTotalPrice'],
      allTotal: json['allTotal'],
    );
  }

  static List<Statistical> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json
        .map<Statistical>((element) => Statistical.fromJson(element))
        .toList();
    // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
