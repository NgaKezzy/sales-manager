class GetSpending {
  String id;
  String idWarehouse;
  String idOrder;
  String revenueDate;
  int revenueMoney;
  String revenueFund;
  String revenueNote;
  int type;
  int kind;

  GetSpending(
      {required this.id,
      required this.idWarehouse,
      required this.idOrder,
      required this.revenueDate,
      required this.revenueMoney,
      required this.revenueFund,
      required this.revenueNote,
      required this.type,
      required this.kind});

  factory GetSpending.fromJson(Map<String, dynamic> json) {
    return GetSpending(
      id: json["_id"],
      idWarehouse: json["idWarehouse"],
      idOrder: json["idOrder"],
      revenueDate: json["revenueDate"],
      revenueMoney: json["revenueMoney"],
      revenueFund: json["revenueFund"],
      revenueNote: json["revenueNote"],
      type: json["type"],
      kind: json["kind"],
    );
  }

  static List<GetSpending> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json
        .map<GetSpending>((spending) => GetSpending.fromJson(spending))
        .toList();
    // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
