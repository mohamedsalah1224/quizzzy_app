import 'academic_year_model.dart';

class User {
  int? id;
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
  AcademicYearModel? academicYear;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  bool? hasVerifiedEmail;
  bool? phoneVerified;
  String? locationArea;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.photo,
      this.locationArea,
      this.hasVerifiedEmail,
      this.dateOfBirth,
      this.governorate,
      this.area,
      this.residenceArea,
      this.specialization,
      this.academicYearId,
      this.providerId,
      this.providerType,
      this.deviceToken,
      this.academicYear,
      this.isActive,
      this.phoneVerified,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        photo: json['photo'],
        dateOfBirth: json['date_of_birth'],
        governorate: json['governorate'],
        area: json['area'],
        residenceArea: json['residence_area'],
        specialization: json['specialization'],
        academicYearId: json['academic_year_id'],
        providerId: json['provider_id'],
        providerType: json['provider_type'],
        deviceToken: json['device_token'],
        academicYear: json['academic_year'] != null
            ? AcademicYearModel.fromJson(json['academic_year'])
            : null,
        isActive: json['is_active'],
        hasVerifiedEmail: json['hasVerifiedEmail'],
        createdAt: json['created_at'],
        phoneVerified: json['phone_verified'],
        locationArea: json['location_area'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'photo': photo,
      'date_of_birth': dateOfBirth,
      'governorate': governorate,
      'area': area,
      'residence_area': residenceArea,
      'specialization': specialization,
      'academic_year_id': academicYearId,
      'provider_id': providerId,
      'provider_type': providerType,
      'device_token': deviceToken,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'hasVerifiedEmail': hasVerifiedEmail,
      'academic_year': academicYear != null ? academicYear!.toJson() : {},
      'location_area': locationArea,
      'phone_verified': phoneVerified,
    };
  }
}
