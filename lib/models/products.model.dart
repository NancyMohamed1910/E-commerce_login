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
    price = jsondata['price'] as double;
    quantity = jsondata['quantity'];
    review = jsondata['review'] as double;
    imagePath = jsondata['imagePath'];
    brand = jsondata['brand'];
    condition = jsondata['condition'];
    sku = jsondata['sku'];
    material = jsondata['material'];
    fitting = jsondata['fitting'];
    createdAt = DateTime.fromMillisecondsSinceEpoch(
        jsondata['createdAt'].millisecondsSinceEpoch);
    // variants = jsondata['variants'];
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
