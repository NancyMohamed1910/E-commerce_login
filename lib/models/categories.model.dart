class CategoryData {
  String? id;
  String? title;
  String? description;
  CategoryData();

  CategoryData.fromJson(Map<String, dynamic> jsondata, String docId) {
    id = docId;
    title = jsondata['title'];
    description = jsondata['description'];
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "description": description};
  }
}
