class NotificationData {
  String? id;
  String? userId;
  String? title;
  String? description;
  DateTime? time;

  NotificationData();
  NotificationData.fromJson(Map<String, dynamic> jsondata, [String? docId]) {
    id = docId;
    userId = jsondata['userId'];
    title = jsondata['title'];
    description = jsondata['description'];
    time = jsondata['time'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            jsondata['time'].millisecondsSinceEpoch)
        : null;
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "description": description,
      "time": time
    };
  }
}
