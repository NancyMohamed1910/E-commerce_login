class ProductData {
  String? id;
  String? categoryId;
  String? description;
  String? name;
  double? price;
  int? quantity;

  ProductData();
  ProductData.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    categoryId = jsondata['categoryId'];
    description = jsondata['description'];
    name = jsondata['name'];
    price = jsondata['price'];
    quantity = jsondata['quantity'];
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "description": description,
      "name": name,
      "price": price,
      "quantity": quantity
    };
  }
}
