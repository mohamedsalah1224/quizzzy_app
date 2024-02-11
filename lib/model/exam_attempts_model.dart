import 'package:quizzy_app/model/links_model.dart';
import 'package:quizzy_app/model/meta_model.dart';

class ExamAttemptsModel {
  bool? success;
  Data? data;
  String? message;

  ExamAttemptsModel({this.success, this.data, this.message});

  factory ExamAttemptsModel.fromJson(Map<String, dynamic> json) {
    return ExamAttemptsModel(
        success: json['success'],
        message: json['message'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data != null ? data!.toJson() : {}
    };
  }
}

class Data {
  List<ExamAttemptsDataModel>? data;
  LinksModel? links;
  MetaModel? meta;

  Data({this.data, this.links, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) {
    List<ExamAttemptsDataModel> list = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        list.add(ExamAttemptsDataModel.fromJson(v));
      });
    }

    return Data(
        meta: json['meta'] != null ? MetaModel.fromJson(json['meta']) : null,
        links:
            json['links'] != null ? LinksModel.fromJson(json['links']) : null,
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

class ExamAttemptsDataModel {
  int? id;
  int? totalQuestions;
  int? totalAnsweredQuestions;
  int? studentId;
  String? subject;

  ExamAttemptsDataModel(
      {this.id,
      this.totalQuestions,
      this.totalAnsweredQuestions,
      this.studentId,
      this.subject});

  factory ExamAttemptsDataModel.fromJson(Map<String, dynamic> json) {
    return ExamAttemptsDataModel(
        id: json['id'],
        totalQuestions: json['total_questions'],
        totalAnsweredQuestions: json['total_answered_questions'],
        studentId: json['student_id'],
        subject: json['subject']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_questions': totalQuestions,
      'total_answered_questions': totalAnsweredQuestions,
      'student_id': studentId,
      'subject': subject,
    };
  }
}
