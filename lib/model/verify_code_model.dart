class VerifyCodeModel {
  bool? success;
  String? message;

  VerifyCodeModel({this.success, this.message});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) {
    return VerifyCodeModel(message: json['message'], success: json['success']);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message};
  }
}
