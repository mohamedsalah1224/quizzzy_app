import 'package:quizzy_app/utils/secure_storage_helper.dart';

// class CacheUserService {
//   static CacheUserService? _instance;
//   static CacheUserService get instance => _instance ??= CacheUserService._();
//   CacheUserService._();
//   final SecureStorageHelper secureStorageHelper = SecureStorageHelper();
//   static const _authTokenKey = 'authToken';

//   Future<String?> read() async {
//     return await secureStorageHelper.read(_authTokenKey);
//   }

//   Future<void> update({required String value}) async {
//     await secureStorageHelper.write(_authTokenKey, value);
//   }

//   Future<void> delete() async {
//     await secureStorageHelper.delete(_authTokenKey);
//   }
// }
