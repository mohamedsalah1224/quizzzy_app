class QuestionsModel {
  int? id;
  String? name;
  String? type;
  String? description;
  String? photo;
  String? semester;
  String? points;
  String? time;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  QuestionsModel(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.photo,
      this.semester,
      this.points,
      this.time,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      time: json['time'],
      points: json['points'],
      description: json['description'],
      semester: json['semester'],
      photo: json['photo'],
      type: json['type'],
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['semester'] = this.semester;
    data['points'] = this.points;
    data['time'] = this.time;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return {
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'photo': photo,
      'semester': semester,
      'points': points,
      'time': time,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }
}
