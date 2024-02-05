import 'package:quizzy_app/model/Image_dimensions_model.dart';

class BookModel {
  int? id;
  String? name;
  String? photo;
  ImageDimensionsModel? imageDimensions;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  BookModel(
      {this.id,
      this.name,
      this.photo,
      this.imageDimensions,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
        isActive: json['is_active'],
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        imageDimensions: json['image_dimensions'] != null
            ? ImageDimensionsModel.fromJson(json['image_dimensions'])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'updated_at': updatedAt,
      'created_at': createdAt,
      'is_active': isActive,
      'photo': photo,
      'name': name,
      'id': id,
      'image_dimensions':
          imageDimensions != null ? imageDimensions!.toJson() : {}
    };
  }
}
