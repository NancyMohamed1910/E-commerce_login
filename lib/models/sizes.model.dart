class SizeData {
  String? sizeId;
  String? value;
  SizeData();
  SizeData.fromJson(Map<String, dynamic> jsondata) {
    sizeId = jsondata['sizeId'];
    value = jsondata['value'];
  }
  Map<String, dynamic> toJson() {
    return {"sizeId": sizeId, "value": value};
  }
}
