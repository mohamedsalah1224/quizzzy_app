class ImageDimensionsModel {
  int? width;
  int? height;

  ImageDimensionsModel({this.width, this.height});

  factory ImageDimensionsModel.fromJson(Map<String, dynamic> json) {
    return ImageDimensionsModel(height: json['height'], width: json['width']);
  }

  Map<String, dynamic> toJson() {
    return {'width': width, 'height': height};
  }
}
