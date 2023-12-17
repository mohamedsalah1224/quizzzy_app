import 'package:quizzy_app/utils/secure_storage_helper.dart';

class AuthTokenService {
  final SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  Future<String?> read({required String key}) async {
    return await secureStorageHelper.read(key);
  }

  Future<void> update({required String key, required String value}) async {
    await secureStorageHelper.write(key, value);
  }

  Future<void> delete({required String key, required String value}) async {
    await secureStorageHelper.delete(key);
  }
}
