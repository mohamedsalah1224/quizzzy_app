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

  String? get getName => name;

  set setName(name) => this.name = name;

  String? get getUsername => username;

  set setUsername(username) => this.username = username;

  String? get getEmail => email;

  set setEmail(email) => this.email = email;

  String? get getPhone => phone;

  set setPhone(phone) => this.phone = phone;

  String? get getPhoto => photo;

  set setPhoto(photo) => this.photo = photo;

  String? get getDateOfBirth => dateOfBirth;

  set setDateOfBirth(dateOfBirth) => this.dateOfBirth = dateOfBirth;

  String? get getGovernorate => governorate;

  set setGovernorate(governorate) => this.governorate = governorate;

  String? get getArea => area;

  set setArea(area) => this.area = area;

  String? get getResidenceArea => residenceArea;

  set setResidenceArea(residenceArea) => this.residenceArea = residenceArea;

  String? get getSpecialization => specialization;

  set setSpecialization(specialization) => this.specialization = specialization;

  int? get getAcademicYearId => academicYearId;

  set setAcademicYearId(academicYearId) => this.academicYearId = academicYearId;

  String? get getProviderId => providerId;

  set setProviderId(providerId) => this.providerId = providerId;

  String? get getProviderType => providerType;

  set setProviderType(providerType) => this.providerType = providerType;

  String? get getDeviceToken => deviceToken;

  set setDeviceToken(deviceToken) => deviceToken;

  String? get getPassword => password;

  set setPassword(password) => this.password = password;
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
