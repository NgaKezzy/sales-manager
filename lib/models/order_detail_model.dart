class OrderDetail {
  String id;
  String idOrder;
  String idProduct;
  int quantityOrder;
  int totalPrice;

  OrderDetail(
      {required this.id,
      required this.idOrder,
      required this.idProduct,
      required this.quantityOrder,
      required this.totalPrice});

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
        id: json['_id'],
        idOrder: json['idOrder'],
        idProduct: json['idProduct'],
        quantityOrder: json['quantityOrder'],
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
