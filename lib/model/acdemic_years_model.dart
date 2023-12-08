class AcdemicYearsModel {
  bool? success;
  List<AcdemicYearsModel>? data;
  String? message;

  AcdemicYearsModel({this.success, this.data, this.message});

  factory AcdemicYearsModel.fromJson(Map<String, dynamic> json) {
    List<AcdemicYearsModel> list = [];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        list.add(AcdemicYearsModel.fromJson(v));
      });
    }

    return AcdemicYearsModel(
      message: json['message'],
      success: json['success'],
      data: list,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data != null ? data!.map((v) => v.toJson()).toList() : [],
    };
  }
}
