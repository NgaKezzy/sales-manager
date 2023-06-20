import 'dart:convert';
import 'dart:ffi';

class Product {
  String id;
  String idWarehouse;
  String productName;
  String productImage;
  int importPrice;
  int price;
  String inventoryNumber;
  int quantity;
  String created_at;
  String updatedAt;

  Product(
      {required this.id,
      required this.idWarehouse,
      required this.productName,
      required this.productImage,
      required this.importPrice,
      required this.price,
      required this.inventoryNumber,
      required this.quantity,
      required this.created_at,
      required this.updatedAt});

  factory Product.formJson(Map<String, dynamic> json) {
    return Product(
        id: json['_id'],
        idWarehouse: json['idWarehouse'],
        productName: json['productName'],
        productImage: json['productImage'],
        importPrice: json['importPrice'],
        price: json['price'],
        inventoryNumber: json['inventoryNumber'],
        quantity: json['quantity'],
        created_at: json['created_at'],
        updatedAt: json['updatedAt']);
  }

  static List<Product> convertToProduct(List<dynamic> json) {
    //json ở đây là data
    return json.map<Product>((product) => Product.formJson(product)).toList();
    // post này là từng inten   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
