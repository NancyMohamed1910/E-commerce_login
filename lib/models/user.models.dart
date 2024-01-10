class UsersData {
  String? userid;
  String? name;
  String? address;
  String? age;
  String? email;
  String? phone;
  String? image;
  UsersData();
  UsersData.fromjson(Map<String, dynamic> jsondata, String? docId) {
    userid = docId;
    name = jsondata['name'];
    address = jsondata['address'];
    age = jsondata['age'];
    email = jsondata['email'];
    phone = jsondata['phone'];
    image = jsondata['image'];
  }
  Map<String, dynamic> toJson() {
    return {
      "userid": userid,
      "name": name,
      "address": address,
      "age": age,
      "email": email,
      "phone": phone,
      "image": image
    };
  }
}
