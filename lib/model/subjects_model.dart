import 'package:quizzy_app/model/data_subject_model.dart';

class SubjectsModel {
  bool? success;
  List<DataSubjectModel>? data;
  String? message;

  SubjectsModel({this.success, this.data, this.message});

  factory SubjectsModel.fromJson(Map<String, dynamic> json) {
    List<DataSubjectModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DataSubjectModel.fromJson(v));
      });
    }

    return SubjectsModel(
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
