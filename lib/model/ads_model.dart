class AdsModel {
  bool? success;
  List<Data>? data;
  String? message;

  AdsModel({this.success, this.data, this.message});

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    List<Data> list = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        list.add(Data.fromJson(v));
      });
    }

    return AdsModel(
        message: json['message'], success: json['success'], data: list);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data != null ? data!.map((v) => v.toJson()).toList() : []
    };
  }
}

class Data {
  int? id;
  String? title;
  String? photo;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.photo,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'photo': photo,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }
}
