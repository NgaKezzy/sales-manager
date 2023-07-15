class ListOrder {
  String id;
  String idWarehouse;
  String purchaseDate;
  String noteOrder;
  String funds;
  String customerName;
  String bill;
  int totalPrice;

  ListOrder(
      {required this.id,
      required this.idWarehouse,
      required this.purchaseDate,
      required this.noteOrder,
      required this.funds,
      required this.customerName,
      required this.bill,
      required this.totalPrice});

  factory ListOrder.fromJson(Map<String, dynamic> json) {
    return ListOrder(
      id: json['_id'],
      idWarehouse: json['idWarehouse'],
      purchaseDate: json['purchaseDate'],
      noteOrder: json['noteOrder'],
      funds: json['funds'],
      customerName: json['customerName'],
      bill: json['bill'],
      
      totalPrice: json['totalPrice']
    );
  }

  static List<ListOrder> convertToListOrder(List<dynamic> json) {
    //json ở đây là data
    return json.map<ListOrder>((order) => ListOrder.fromJson(order)).toList();
    // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
