class AnswerQuestionModel {
  bool? success;
  Data? data;
  String? message;

  AnswerQuestionModel({this.success, this.data, this.message});

  factory AnswerQuestionModel.fromJson(Map<String, dynamic> json) {
    return AnswerQuestionModel(
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
  String? examAttemptId;
  String? questionId;
  String? givenAnswer;
  String? questionMark;
  int? achievedMark;
  int? minusMark;
  bool? isCorrect; // Check Again if int or bool
  int? examId;
  int? studentId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.examAttemptId,
      this.questionId,
      this.givenAnswer,
      this.questionMark,
      this.achievedMark,
      this.minusMark,
      this.isCorrect,
      this.examId,
      this.studentId,
      this.updatedAt,
      this.createdAt,
      this.id});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      examAttemptId: json['exam_attempt_id'],
      questionId: json['question_id'],
      givenAnswer: json['given_answer'],
      questionMark: json['question_mark'],
      achievedMark: json['achieved_mark'],
      minusMark: json['minus_mark'],
      isCorrect: json['is_correct'],
      examId: json['exam_id'],
      studentId: json['student_id'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exam_attempt_id': examAttemptId,
      'question_id': questionId,
      'given_answer': givenAnswer,
      'question_mark': questionMark,
      'achieved_mark': achievedMark,
      'minus_mark': minusMark,
      'is_correct': isCorrect,
      'exam_id': examId,
      'student_id': studentId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id
    };
  }
}
