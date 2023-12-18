class StoreExamModel {
  String? name;
  String? type;
  String? questionTypes;
  String? level;
  String? typeAssessment;
  String? description;
  String? photo;
  String? semester;
  String? isActive;

  StoreExamModel(
      {this.description,
      this.isActive,
      this.level,
      this.name,
      this.photo,
      this.questionTypes,
      this.semester,
      this.type,
      this.typeAssessment});
}
