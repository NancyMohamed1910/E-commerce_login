class ColorsData {
  String? code;
  String? name;
  ColorsData();
  ColorsData.fromJson(Map<String, dynamic> jsondata) {
    code = jsondata['code'];
    name = jsondata['name'];
    //print('---=========================-code:$code');
    //print('---========================--name:$name');
  }
  Map<String, dynamic> toJson() {
    return {"code": code, "name": name};
  }
}
