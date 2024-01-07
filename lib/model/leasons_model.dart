class Lessons {
  int? id;
  String? name;
  String? description;
  String? photo;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Lessons(
      {this.id,
      this.name,
      this.description,
      this.photo,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory Lessons.fromJson(Map<String, dynamic> json) {
    return Lessons(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photo: json['photo'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'photo': photo,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }
}
