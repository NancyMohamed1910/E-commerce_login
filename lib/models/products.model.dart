import 'package:e_commerce/models/colors.models.dart';
import 'package:e_commerce/models/sizes.model.dart';

class ProductData {
  String? id;
  String? categoryId;
  String? description;
  String? name;
  double? price;
  int? quantity;
  double? review;
  String? imagePath;
  List<ColorsData>? colors;
  List<SizeData>? size;

  ProductData();
  ProductData.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    categoryId = jsondata['categoryId'];
    description = jsondata['description'];
    name = jsondata['name'];
    price = jsondata['price'] as double;
    quantity = jsondata['quantity'];
    review = jsondata['review'] as double;

    imagePath = jsondata['imagePath'];
    colors = List<ColorsData>.from(
        jsondata['colors'].map((e) => ColorsData.fromJson(e)));
    size =
        List<SizeData>.from(jsondata['size'].map((e) => SizeData.fromJson(e)));
    print('--------colors--------------:$colors');
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
      "imagePath": imagePath,
      "colors": colors?.map((e) => e.toJson()).toList(),
      "size": size?.map((e) => e.toJson()).toList()
    };
  }
}
