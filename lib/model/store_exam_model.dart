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
  final String? unitId;
  final String? lessonId;
  final String? subjectId;

  StoreExamModel(
      {this.description,
      this.isActive,
      this.level,
      this.name,
      this.photo,
      this.questionTypes,
      this.semester,
      this.type,
      this.lessonId,
      this.subjectId,
      this.unitId,
      this.typeAssessment});
}
