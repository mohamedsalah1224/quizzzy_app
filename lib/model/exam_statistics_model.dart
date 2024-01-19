class ExamStatisticsModel {
  bool? success;
  Data? data;
  String? message;

  ExamStatisticsModel({this.success, this.data, this.message});

  factory ExamStatisticsModel.fromJson(Map<String, dynamic> json) {
    return ExamStatisticsModel(
        data: json['data'] != null ? Data.fromJson(json['data']) : null,
        message: json['message'],
        success: json['success']);
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
  ExamAttempt? examAttempt;
  AttemptAnswers? attemptAnswers;
  Charts? charts;

  Data({this.examAttempt, this.attemptAnswers, this.charts});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        attemptAnswers: json['attempt_answers'] != null
            ? AttemptAnswers.fromJson(json['attempt_answers'])
            : null,
        charts: json['charts'] != null ? Charts.fromJson(json['charts']) : null,
        examAttempt: json['exam_attempt'] != null
            ? ExamAttempt.fromJson(json['exam_attempt'])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'exam_attempt': examAttempt != null ? examAttempt!.toJson() : {},
      'attempt_answers': attemptAnswers != null ? attemptAnswers!.toJson() : {},
      'charts': charts != null ? charts!.toJson() : {},
    };
  }
}

class ExamAttempt {
  int? id;
  int? totalQuestions;
  int? totalAnsweredQuestions;
  String? totalMarks;
  String? earnedMarks;
  String? attemptInfo;
  String? attemptStatus;
  String? attemptIp;
  String? attemptStartedAt;
  String? attemptEndedAt;
  bool? isManuallyReviewed; //  review it
  String? manuallyReviewedAt;
  int? examId;
  int? subjectId;
  int? bookId;
  int? studentId;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  Exam? exam;
  String? book; // reviw
  String? subject; //review
  int? numberCorrectAnswer;
  int? numberWrongAnswer;

  ExamAttempt(
      {this.id,
      this.totalQuestions,
      this.totalAnsweredQuestions,
      this.totalMarks,
      this.earnedMarks,
      this.attemptInfo,
      this.attemptStatus,
      this.attemptIp,
      this.attemptStartedAt,
      this.attemptEndedAt,
      this.isManuallyReviewed,
      this.manuallyReviewedAt,
      this.examId,
      this.subjectId,
      this.bookId,
      this.studentId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.exam,
      this.book,
      this.subject,
      this.numberCorrectAnswer,
      this.numberWrongAnswer});

  factory ExamAttempt.fromJson(Map<String, dynamic> json) {
    return ExamAttempt(
        numberWrongAnswer: json['number_wrong_answer'],
        numberCorrectAnswer: json['number_correct_answer'],
        subject: json['subject'],
        book: json['book'],
        exam: json['exam'] != null ? Exam.fromJson(json['exam']) : null,
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
        updatedBy: json['updated_by'],
        createdBy: json['created_by'],
        studentId: json['student_id'],
        bookId: json['book_id'],
        subjectId: json['subject_id'],
        examId: json['exam_id'],
        manuallyReviewedAt: json['manually_reviewed_at'],
        isManuallyReviewed: json['is_manually_reviewed'],
        attemptEndedAt: json['attempt_ended_at'],
        attemptStartedAt: json['attempt_started_at'],
        attemptIp: json['attempt_ip'],
        attemptStatus: json['attempt_status'],
        attemptInfo: json['attempt_info'],
        earnedMarks: json['earned_marks'],
        totalMarks: json['total_marks'],
        totalAnsweredQuestions: json['total_answered_questions'],
        totalQuestions: json['total_questions'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'attempt_status': attemptStatus,
      'attempt_info': attemptInfo,
      'earned_marks': earnedMarks,
      'total_marks': totalMarks,
      'total_answered_questions': totalAnsweredQuestions,
      'total_questions': totalQuestions,
      'id': id,
      'attempt_ip': attemptIp,
      'created_by': createdBy,
      'student_id': studentId,
      'book_id': bookId,
      'subject_id': subjectId,
      'exam_id': examId,
      'manually_reviewed_at': manuallyReviewedAt,
      'is_manually_reviewed': isManuallyReviewed,
      'attempt_ended_at': attemptEndedAt,
      'attempt_started_at': attemptStartedAt,
      'created_at': createdAt,
      'updated_by': createdBy,
      'updated_at': updatedAt,
      'number_wrong_answer': numberWrongAnswer,
      'number_correct_answer': numberCorrectAnswer,
      'subject': subject,
      'book': book,
      'exam': exam != null ? exam!.toJson() : {}
    };
  }
}

class Exam {
  int? id;
  String? name;
  String? type;
  String? questionTypes;
  String? level;
  String? typeAssessment;
  String? description;
  String? photo;
  String? semester;
  String? points;
  String? time;
  int? subjectId;
  int? bookId;
  int? unitId;
  int? lessonId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Exam(
      {this.id,
      this.name,
      this.type,
      this.questionTypes,
      this.level,
      this.typeAssessment,
      this.description,
      this.photo,
      this.semester,
      this.points,
      this.time,
      this.subjectId,
      this.bookId,
      this.unitId,
      this.lessonId,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Exam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    questionTypes = json['question_types'];
    level = json['level'];
    typeAssessment = json['type_assessment'];
    description = json['description'];
    photo = json['photo'];
    semester = json['semester'];
    points = json['points'];
    time = json['time'];
    subjectId = json['subject_id'];
    bookId = json['book_id'];
    unitId = json['unit_id'];
    lessonId = json['lesson_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['question_types'] = this.questionTypes;
    data['level'] = this.level;
    data['type_assessment'] = this.typeAssessment;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['semester'] = this.semester;
    data['points'] = this.points;
    data['time'] = this.time;
    data['subject_id'] = this.subjectId;
    data['book_id'] = this.bookId;
    data['unit_id'] = this.unitId;
    data['lesson_id'] = this.lessonId;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AttemptAnswers {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  AttemptAnswers(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  AttemptAnswers.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataSummaryOfQuestion {
  int? id;
  String? questionMark;
  String? achievedMark;
  String? minusMark;
  String? givenAnswer;
  bool? isCorrect;
  int? examAttemptId;
  int? questionId;
  int? examId;
  int? studentId;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  Question? question;

  DataSummaryOfQuestion(
      {this.id,
      this.questionMark,
      this.achievedMark,
      this.minusMark,
      this.givenAnswer,
      this.isCorrect,
      this.examAttemptId,
      this.questionId,
      this.examId,
      this.studentId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.question});

  DataSummaryOfQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionMark = json['question_mark'];
    achievedMark = json['achieved_mark'];
    minusMark = json['minus_mark'];
    givenAnswer = json['given_answer'];
    isCorrect = json['is_correct'];
    examAttemptId = json['exam_attempt_id'];
    questionId = json['question_id'];
    examId = json['exam_id'];
    studentId = json['student_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_mark'] = this.questionMark;
    data['achieved_mark'] = this.achievedMark;
    data['minus_mark'] = this.minusMark;
    data['given_answer'] = this.givenAnswer;
    data['is_correct'] = this.isCorrect;
    data['exam_attempt_id'] = this.examAttemptId;
    data['question_id'] = this.questionId;
    data['exam_id'] = this.examId;
    data['student_id'] = this.studentId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    return data;
  }
}

class Question {
  int? id;
  String? name;
  String? type;
  String? level;
  String? description;
  String? photo;
  String? file;
  String? points;
  String? time;
  bool? isActive;
  int? lessonId;
  String? createdAt;
  String? updatedAt;
  String? reference;
  String? notes;
  bool? needReview;
  List<Answers>? answers;

  Question(
      {this.id,
      this.name,
      this.type,
      this.level,
      this.description,
      this.photo,
      this.file,
      this.points,
      this.time,
      this.isActive,
      this.lessonId,
      this.createdAt,
      this.updatedAt,
      this.reference,
      this.notes,
      this.needReview,
      this.answers});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    level = json['level'];
    description = json['description'];
    photo = json['photo'];
    file = json['file'];
    points = json['points'];
    time = json['time'];
    isActive = json['is_active'];
    lessonId = json['lesson_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reference = json['reference'];
    notes = json['notes'];
    needReview = json['need_review'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['level'] = this.level;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['file'] = this.file;
    data['points'] = this.points;
    data['time'] = this.time;
    data['is_active'] = this.isActive;
    data['lesson_id'] = this.lessonId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['reference'] = this.reference;
    data['notes'] = this.notes;
    data['need_review'] = this.needReview;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? title;
  String? questionType;
  String? answerTwoGapMatch;
  String? answerViewFormat;
  String? answerOrder;
  String? answerSettings;
  int? questionId;
  String? photo;
  bool? isCorrect;
  String? createdAt;
  String? updatedAt;

  Answers(
      {this.id,
      this.title,
      this.questionType,
      this.answerTwoGapMatch,
      this.answerViewFormat,
      this.answerOrder,
      this.answerSettings,
      this.questionId,
      this.photo,
      this.isCorrect,
      this.createdAt,
      this.updatedAt});

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
      id: json['id'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      isCorrect: json['is_correct'],
      photo: json['photo'],
      questionId: json['question_id'],
      answerSettings: json['answer_settings'],
      answerOrder: json['answer_order'],
      answerViewFormat: json['answer_view_format'],
      answerTwoGapMatch: json['answer_two_gap_match'],
      questionType: json['question_type'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_type': questionType,
      'title': title,
      'id': id,
      'answer_two_gap_match': answerTwoGapMatch,
      'question_id': questionId,
      'answer_settings': answerSettings,
      'answer_order': answerOrder,
      'answer_view_format': answerViewFormat,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'is_correct': isCorrect,
      'photo': photo,
    };
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
        active: json['active'], label: json['label'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'label': label, 'active': active};
  }
}

class Charts {
  List<IsCorrect>? isCorrect;

  Charts({this.isCorrect});

  factory Charts.fromJson(Map<String, dynamic> json) {
    List<IsCorrect> listIsCorrect = [];
    if (json['is_correct'] != null) {
      json['is_correct'].forEach((v) {
        listIsCorrect.add(IsCorrect.fromJson(v));
      });
    }

    return Charts(isCorrect: listIsCorrect);
  }

  Map<String, dynamic> toJson() {
    return {
      'is_correct':
          isCorrect != null ? isCorrect!.map((v) => v.toJson()).toList() : []
    };
  }
}

class IsCorrect {
  int? number;
  int? label;

  IsCorrect({this.number, this.label});

  factory IsCorrect.fromJson(Map<String, dynamic> json) {
    return IsCorrect(label: json['label'], number: json['num']);
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'num': number,
    };
  }
}
