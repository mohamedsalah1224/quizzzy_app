class AcademicYearModel {
  int? id;
  String? name;
  String? photo;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  AcademicYearModel(
      {this.id,
      this.name,
      this.photo,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory AcademicYearModel.fromJson(Map<String, dynamic> json) {
    return AcademicYearModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      isActive: json['is_active'],
      photo: json['photo'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'name': name,
      'photo': photo,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }
}
