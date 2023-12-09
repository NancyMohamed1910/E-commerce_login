class AdvertiesData {
  String? id;
  String? imagePath;
  String? description;
  AdvertiesData();
  AdvertiesData.fromJson(Map<String, dynamic> jsondata) {
    id = jsondata['id'];
    imagePath = jsondata['imagePath'];
    description = jsondata['desccription'];
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "imagePath": imagePath, "description": description};
  }
}