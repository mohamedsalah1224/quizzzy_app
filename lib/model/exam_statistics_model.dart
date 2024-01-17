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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.examAttempt != null) {
      data['exam_attempt'] = this.examAttempt!.toJson();
    }
    if (this.attemptAnswers != null) {
      data['attempt_answers'] = this.attemptAnswers!.toJson();
    }
    if (this.charts != null) {
      data['charts'] = this.charts!.toJson();
    }
    return data;
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

  ExamAttempt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalQuestions = json['total_questions'];
    totalAnsweredQuestions = json['total_answered_questions'];
    totalMarks = json['total_marks'];
    earnedMarks = json['earned_marks'];
    attemptInfo = json['attempt_info'];
    attemptStatus = json['attempt_status'];
    attemptIp = json['attempt_ip'];
    attemptStartedAt = json['attempt_started_at'];
    attemptEndedAt = json['attempt_ended_at'];
    isManuallyReviewed = json['is_manually_reviewed'];
    manuallyReviewedAt = json['manually_reviewed_at'];
    examId = json['exam_id'];
    subjectId = json['subject_id'];
    bookId = json['book_id'];
    studentId = json['student_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
    book = json['book'];
    subject = json['subject'];
    numberCorrectAnswer = json['number_correct_answer'];
    numberWrongAnswer = json['number_wrong_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_questions'] = this.totalQuestions;
    data['total_answered_questions'] = this.totalAnsweredQuestions;
    data['total_marks'] = this.totalMarks;
    data['earned_marks'] = this.earnedMarks;
    data['attempt_info'] = this.attemptInfo;
    data['attempt_status'] = this.attemptStatus;
    data['attempt_ip'] = this.attemptIp;
    data['attempt_started_at'] = this.attemptStartedAt;
    data['attempt_ended_at'] = this.attemptEndedAt;
    data['is_manually_reviewed'] = this.isManuallyReviewed;
    data['manually_reviewed_at'] = this.manuallyReviewedAt;
    data['exam_id'] = this.examId;
    data['subject_id'] = this.subjectId;
    data['book_id'] = this.bookId;
    data['student_id'] = this.studentId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.exam != null) {
      data['exam'] = this.exam!.toJson();
    }
    data['book'] = this.book;
    data['subject'] = this.subject;
    data['number_correct_answer'] = this.numberCorrectAnswer;
    data['number_wrong_answer'] = this.numberWrongAnswer;
    return data;
  }
}

class Exam {
  int? id;
  String? name;
  String? type;
  Null? questionTypes;
  Null? level;
  String? typeAssessment;
  Null? description;
  String? photo;
  String? semester;
  Null? points;
  String? time;
  Null? subjectId;
  Null? bookId;
  Null? unitId;
  Null? lessonId;
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

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    questionType = json['question_type'];
    answerTwoGapMatch = json['answer_two_gap_match'];
    answerViewFormat = json['answer_view_format'];
    answerOrder = json['answer_order'];
    answerSettings = json['answer_settings'];
    questionId = json['question_id'];
    photo = json['photo'];
    isCorrect = json['is_correct'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['question_type'] = this.questionType;
    data['answer_two_gap_match'] = this.answerTwoGapMatch;
    data['answer_view_format'] = this.answerViewFormat;
    data['answer_order'] = this.answerOrder;
    data['answer_settings'] = this.answerSettings;
    data['question_id'] = this.questionId;
    data['photo'] = this.photo;
    data['is_correct'] = this.isCorrect;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class Charts {
  List<IsCorrect>? isCorrect;

  Charts({this.isCorrect});

  Charts.fromJson(Map<String, dynamic> json) {
    if (json['is_correct'] != null) {
      isCorrect = <IsCorrect>[];
      json['is_correct'].forEach((v) {
        isCorrect!.add(new IsCorrect.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.isCorrect != null) {
      data['is_correct'] = this.isCorrect!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IsCorrect {
  int? num;
  int? label;

  IsCorrect({this.num, this.label});

  IsCorrect.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['label'] = this.label;
    return data;
  }
}
