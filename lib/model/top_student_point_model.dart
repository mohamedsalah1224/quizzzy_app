import 'package:quizzy_app/model/links_model.dart';
import 'package:quizzy_app/model/meta_model.dart';

class TopStudentPointModel {
  bool? success;
  Data? data;
  String? message;

  TopStudentPointModel({this.success, this.data, this.message});

  factory TopStudentPointModel.fromJson(Map<String, dynamic> json) {
    return TopStudentPointModel(
        message: json['message'],
        success: json['success'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data != null ? data!.toJson() : {}
    };
  }
}

class Data {
  List<TopStudentDataModel>? data;
  LinksModel? links;
  MetaModel? meta;

  Data({this.data, this.links, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) {
    List<TopStudentDataModel> list = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        list.add(TopStudentDataModel.fromJson(v));
      });
    }

    return Data(
        links:
            json['links'] != null ? LinksModel.fromJson(json['links']) : null,
        meta: json['meta'] != null ? MetaModel.fromJson(json['meta']) : null,
        data: list);
  }

  Map<String, dynamic> toJson() {
    return {
      'meta': meta != null ? meta!.toJson() : {},
      'links': links != null ? links!.toJson() : {},
      'data': data != null ? data!.map((v) => v.toJson()).toList() : []
    };
  }
}

class TopStudentDataModel {
  String? totalMarks;
  String? earnedMarks;
  Student? student;
  int? isCurrentStudent;

  TopStudentDataModel(
      {this.totalMarks, this.earnedMarks, this.student, this.isCurrentStudent});

  factory TopStudentDataModel.fromJson(Map<String, dynamic> json) {
    return TopStudentDataModel(
        earnedMarks: json['earned_marks'],
        totalMarks: json['total_marks'],
        isCurrentStudent: json['is_current_student'],
        student:
            json['student'] != null ? Student.fromJson(json['student']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'is_current_student': isCurrentStudent,
      'total_marks': totalMarks,
      'earned_marks': earnedMarks,
      'student': student != null ? student!.toJson() : {}
    };
  }
}

class Student {
  int? id;
  String? username;
  String? name;
  String? email;
  String? photo;

  Student({this.id, this.username, this.name, this.email, this.photo});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        name: json['name'],
        photo: json['photo']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'email': email,
      'photo': photo
    };
  }
}
