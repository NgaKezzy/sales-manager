class OrderDetail {
  String id;
  String idWarehouse;
  String productName;
  String productImage;
  int importPrice;
  int price;
  int inventoryNumber;
  int quantity;
  int totalPrice;

  OrderDetail(
      {required this.id,
      required this.idWarehouse,
      required this.productName,
      required this.productImage,
      required this.importPrice,
      required this.price,
      required this.inventoryNumber,
      required this.quantity,
      required this.totalPrice});

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
        id: json['_id'],
        idWarehouse: json['idWarehouse'],
        productName: json['productName'],
        productImage: json['productImage'],
        importPrice: json['importPrice'],
        price: json['price'],
        inventoryNumber: json['inventoryNumber'],
        quantity: json['quantity'],
        totalPrice: json['totalPrice']);
  }

  static List<OrderDetail> convertToListOrderDetail(List<dynamic> json) {
    //json ở đây là data
    return json
        .map<OrderDetail>((orderDetail) => OrderDetail.fromJson(orderDetail))
        .toList();
    // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
