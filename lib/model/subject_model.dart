import 'package:quizzy_app/model/academic_year_model.dart';

class SubjectModel {
  bool? success;
  List<Data>? data;
  String? message;

  SubjectModel({this.success, this.data, this.message});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    List<Data> data = [];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }

    return SubjectModel(
        message: json['message'], success: json['success'], data: data);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data != null ? data!.map((v) => v.toJson()).toList() : []
    };
  }
}

class Data {
  int? id;
  String? name;
  String? photo;
  String? semester;
  int? academicYearId;
  AcademicYearModel? academicYear;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.photo,
      this.semester,
      this.academicYearId,
      this.academicYear,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        academicYearId: json['academic_year_id'],
        name: json['name'],
        photo: json['photo'],
        semester: json['semester'],
        isActive: json['is_active'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        academicYear: json['academic_year'] != null
            ? AcademicYearModel.fromJson(json['academic_year'])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'semester': semester,
      'academic_year_id': academicYearId,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'academic_year': academicYear != null ? academicYear!.toJson() : {}
    };
  }
}
