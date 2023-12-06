import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  EndPoint._();

  /// Assets for imagesAccount
  /// assets/images/account.png
  static String baseUrl = dotenv.get('BASE_URL');

  static String register = dotenv.get('POPLAR_PEOPLE');
// https://api.themoviedb.org/3/person/popular?api_key=fdd781f0c3c5c144079ecc6c5ca41814&page=2
  static String profilePersonImage({required int person_id}) {
    return "person/$person_id/images";
  }

  static String imagePath = dotenv.get('IMAGE_PATH');
}
