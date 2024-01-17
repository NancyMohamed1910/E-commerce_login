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
    review = jsondata['review'] is int
        ? (jsondata['review'] as int).toDouble()
        : jsondata['review'];
    comment = jsondata['comment'];
    date = jsondata['date'];
    createdAt = jsondata['createdAt'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            jsondata['createdAt'].millisecondsSinceEpoch)
        : null;
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "productId": productId,
      "review": review,
      "comment": comment,
      "date": date,
      "createdAt": createdAt,
    };
  }
}
