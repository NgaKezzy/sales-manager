class RevenueExpenditure {
  String idOrder;
  String? idWareHouse;
  String revenueDate;
  String revenueFund;
  int revenueMoney;
  String revenueNote;
  int type;

  RevenueExpenditure(
      {required this.idOrder,
      required this.idWareHouse,
      required this.revenueDate,
      required this.revenueFund,
      required this.revenueMoney,
      required this.revenueNote,
      required this.type});

  factory RevenueExpenditure.fromJson(Map<String, dynamic> json) {
    return RevenueExpenditure(
        idOrder: json['idOrder'],
        idWareHouse: json['idWareHouse'],
        revenueDate: json['revenueDate'],
        revenueFund: json['revenueFund'],
        revenueMoney: json['revenueMoney'],
        revenueNote: json['revenueNote'],
        type: json['type']);
  }
}
