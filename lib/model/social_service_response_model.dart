class SocialServiceResponseModel {
  String? providerId;
  String? providertype;
  bool status;

  SocialServiceResponseModel(
      {this.providerId, this.providertype, required this.status});
}
