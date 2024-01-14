import 'package:e_commerce/models/categories.model.dart';

class ProductData {
  String? id;
  CategoryData? category;
  String? description;
  String? name;
  double? price;
  int? quantity;
  double? review;
  String? imagePath;
  String? brand;
  String? condition;
  String? sku;
  String? material;
  String? fitting;
  DateTime? createdAt;
  Map<String, List<dynamic>>? variants;

  ProductData();
  ProductData.fromJson(Map<String, dynamic> jsondata, [String? docId]) {
    id = docId;
    category = jsondata['category'] != null
        ? CategoryData.fromJson(jsondata['category'])
        : null;
    description = jsondata['description'];
    name = jsondata['name'];
    price = jsondata['price'] is int
        ? (jsondata['price'] as int).toDouble()
        : jsondata['price'];
    quantity = jsondata['quantity'];
    review = jsondata['review'] is int
        ? (jsondata['review'] as int).toDouble()
        : jsondata['review'];
    imagePath = jsondata['imagePath'];
    brand = jsondata['brand'];
    condition = jsondata['condition'];
    sku = jsondata['sku'];
    material = jsondata['material'];
    fitting = jsondata['fitting'];

    createdAt = jsondata['createdAt'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            jsondata['createdAt'].millisecondsSinceEpoch)
        : null;
    variants = Map<String, List<dynamic>>.from(jsondata['variants']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": category?.toJson(),
      "description": description,
      "name": name,
      "price": price,
      "quantity": quantity,
      "review": review,
      "imagePath": imagePath,
      "brand": brand,
      "condition": condition,
      "sku": sku,
      "material": material,
      "fitting": fitting,
      "createdAt": createdAt,
      "variants": variants
    };
  }
}
