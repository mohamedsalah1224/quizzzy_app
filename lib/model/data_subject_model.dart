import 'package:quizzy_app/model/academic_year_model.dart';

class DataSubjectModel {
  int? id;
  String? name;
  String? photo;
  String? semester;
  int? academicYearId;
  AcademicYearModel? academicYear;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  DataSubjectModel(
      {this.id,
      this.name,
      this.photo,
      this.semester,
      this.academicYearId,
      this.academicYear,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory DataSubjectModel.fromJson(Map<String, dynamic> json) {
    return DataSubjectModel(
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
