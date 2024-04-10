// To parse this JSON data, do
//
//     final createPostModel = createPostModelFromJson(jsonString);

import 'dart:convert';

CreatePostModel createPostModelFromJson(String str) => CreatePostModel.fromJson(json.decode(str));

String createPostModelToJson(CreatePostModel data) => json.encode(data.toJson());

class CreatePostModel {
  CreatePostModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory CreatePostModel.fromJson(Map<String, dynamic> json) => CreatePostModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.categoryId,
    this.languageId,
    this.userId,
    this.type,
    this.post,
    this.status,
    this.insertDate,
    this.updateDate,
  });

  String? id;
  String? categoryId;
  String? languageId;
  String? userId;
  String? type;
  String? post;
  String? status;
  DateTime? insertDate;
  DateTime? updateDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryId: json["category_id"],
    languageId: json["language_id"],
    userId: json["user_id"],
    type: json["type"],
    post: json["post"],
    status: json["status"],
    insertDate: DateTime.parse(json["insert_date"]),
    updateDate: DateTime.parse(json["update_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "language_id": languageId,
    "user_id": userId,
    "type": type,
    "post": post,
    "status": status,
    "insert_date": insertDate!.toIso8601String(),
    "update_date": updateDate!.toIso8601String(),
  };
}
