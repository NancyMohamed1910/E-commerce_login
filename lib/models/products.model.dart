class ProductData {
  String? id;
  String? categoryId;
  String? description;
  String? name;
  double? price;
  int? quantity;
  double? review;
  //List<String>? colors;
  //List<String>? size;
  String? imagePath;

  ProductData();
  ProductData.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    categoryId = jsondata['categoryId'];
    description = jsondata['description'];
    name = jsondata['name'];
    price = jsondata['price'];
    quantity = jsondata['quantity'];
    review = jsondata['review'] as double;
    // colors = jsondata['colors'] as List<String>;
    // size = jsondata['size'] as List<String>;
    imagePath = jsondata['imagePath'];
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "description": description,
      "name": name,
      "price": price,
      "quantity": quantity,
      "review": review,
      // "colors": colors,
      // "size": size,
      "imagePath": imagePath,
    };
  }
}
