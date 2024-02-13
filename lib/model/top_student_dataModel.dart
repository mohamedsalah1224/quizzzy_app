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
