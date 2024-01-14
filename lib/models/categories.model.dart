class CategoryData {
  String? id;
  String? title;
  String? description;
  String? image;
  int? shadowColor;
  List<int>? colors;
  DateTime? createdAt;
  Map<String, List<dynamic>>? subcategory;
  CategoryData();

  CategoryData.fromJson(Map<String, dynamic> jsondata, [String? docId]) {
    id = docId;
    title = jsondata['title'];
    description = jsondata['description'];
    image = jsondata['image'];
    shadowColor = jsondata['shadowColor'];
    colors = jsondata['colors'] != null
        ? List<int>.from(jsondata['colors'].map((e) => e))
        : null;

    createdAt = jsondata['createdAt'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            jsondata['createdAt'].millisecondsSinceEpoch)
        : null;
    subcategory = Map<String, List<dynamic>>.from(jsondata['subcategory']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['shadowColor'] = shadowColor;
    data['colors'] = colors;
    data['createdAt'] = createdAt;
    data['subcategory'] = subcategory;
    return data;
  }
}
