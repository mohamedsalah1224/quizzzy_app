class RegisterModel {
  String? name;
  String? username;
  String? email;
  String? phone;
  String? photo;
  String? dateOfBirth;
  String? governorate;
  String? area;
  String? residenceArea;
  String? specialization;
  int? academicYearId;
  String? providerId;
  String? providerType;
  String? deviceToken;
  String? password;

  RegisterModel(
      {this.name,
      this.username,
      this.email,
      this.phone,
      this.photo,
      this.dateOfBirth,
      this.governorate,
      this.area,
      this.residenceArea,
      this.specialization,
      this.academicYearId,
      this.providerId,
      this.providerType,
      this.deviceToken,
      this.password});
}
