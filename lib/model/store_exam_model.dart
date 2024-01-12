class StoreExamModel {
  final String? name;
  final String? type;
  final String? questionTypes;
  final String? level;
  final String? typeAssessment;
  final String? description;
  final String? photo;
  final String? semester;
  final String? isActive;
  final int? unitId;
  final int? lessonId;
  final int? subjectId;
  final String? time;

  StoreExamModel(
      {this.description,
      this.isActive = '1',
      this.level,
      this.time,
      this.name,
      this.photo,
      this.questionTypes,
      required this.semester,
      this.type,
      this.lessonId,
      required this.subjectId,
      this.unitId,
      this.typeAssessment});
}
