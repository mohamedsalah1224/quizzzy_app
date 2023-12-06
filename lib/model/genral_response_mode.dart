class GeneralResponseModel {
  bool? success;
  String? message;

  GeneralResponseModel({this.success, this.message});

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    return GeneralResponseModel(
        message: json['success'], success: json['message']);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message};
  }
}
