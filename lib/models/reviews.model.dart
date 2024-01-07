class ReviewsData {
  String? id;
  String? userId;
  String? productId;
  double? review;
  String? comment;
  DateTime? date;
  DateTime? createdAt;
  ReviewsData();
  ReviewsData.fromJson(Map<String, dynamic> jsondata, [String? docId]) {
    id = docId;
    userId = jsondata['userId'];
    productId = jsondata['productId'];
  }
/////
  ///
/*
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
        : jsondata['review']; //jsondata['review'] as double;
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
  }*/
/////
}
