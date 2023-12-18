import 'package:quizzy_app/model/exam_model.dart';

class ExamsModel {
  bool? success;
  List<ExamModel>? data;
  String? message;

  ExamsModel({this.success, this.data, this.message});

  factory ExamsModel.fromJson(Map<String, dynamic> json) {
    List<ExamModel> listExamModel = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        listExamModel.add(ExamModel.fromJson(v));
      });
    }

    return ExamsModel(
        message: json['message'],
        success: json['success'],
        data: listExamModel);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data != null ? data!.map((v) => v.toJson()).toList() : []
    };
  }
}
