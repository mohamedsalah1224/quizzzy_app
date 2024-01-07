import 'package:quizzy_app/model/leasons_model.dart';

class UnitDataModel {
  int? id;
  String? name;
  String? description;
  String? photo;
  List<LessonsModel>? lessons;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  UnitDataModel(
      {this.id,
      this.name,
      this.description,
      this.photo,
      this.lessons,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory UnitDataModel.fromJson(Map<String, dynamic> json) {
    List<LessonsModel> listLeaseon = [];

    if (json['lessons'] != null) {
      json['lessons'].forEach((v) {
        listLeaseon.add(LessonsModel.fromJson(v));
      });
    }

    return UnitDataModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        photo: json['photo'],
        isActive: json['is_active'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        lessons: listLeaseon);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'photo': photo,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'lessons': lessons != null ? lessons!.map((v) => v.toJson()).toList() : []
    };
  }
}
