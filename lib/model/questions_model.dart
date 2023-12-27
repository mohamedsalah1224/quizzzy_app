import 'package:quizzy_app/model/answers_model.dart';

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
  List<AnswersModel>? answers;

  QuestionsModel(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.photo,
      this.semester,
      this.points,
      this.answers,
      this.time,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    List<AnswersModel> lisAnswerModel = [];
    if (json['answers'] != null) {
      json['answers'].forEach((v) {
        lisAnswerModel.add(AnswersModel.fromJson(v));
      });
    }
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
        answers: lisAnswerModel);
  }

  Map<String, dynamic> toJson() {
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
      'updated_at': updatedAt,
      'answers': answers != null ? answers!.map((v) => v.toJson()).toList() : []
    };
  }
}
