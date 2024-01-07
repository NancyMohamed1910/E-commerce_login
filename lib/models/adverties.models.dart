class AdvertiesData {
  String? id;
  String? imagePath;
  String? description;
  AdvertiesData();
  AdvertiesData.fromJson(Map<String, dynamic> jsondata, String docId) {
    //Deserialization convert from json to dart object
    id = docId;
    imagePath = jsondata['imagePath'];
    description = jsondata['desccription'];
  }
  Map<String, dynamic> toJson() {
    //serialization-convert form dart opject to json
    return {"id": id, "imagePath": imagePath, "description": description};
  }
}
