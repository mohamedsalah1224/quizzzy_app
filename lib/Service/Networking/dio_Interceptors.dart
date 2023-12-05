import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class DioInterceptors extends Interceptor {
  final Dio dio;

  DioInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Accept'] = "accept: application/json";
    options.headers['Authorization'] =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZGQ3ODFmMGMzYzVjMTQ0MDc5ZWNjNmM1Y2E0MTgxNCIsInN1YiI6IjY1NjdhZDk3M2Q3NDU0MDBlYTI3OTQ4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3gCSnqmohI8UvcOoHczf1Y7D4aMfD3nWs5ghFlgIArU";

    //  var accessToken = await TokenRepository().getAccessToken();

    // if (accessToken != null) {
    //   var expiration = await TokenRepository().getAccessTokenRemainingTime();

    //   if (expiration.inSeconds < 60) {
    //     dio.interceptors.requestLock.lock();

    //     // Call the refresh endpoint to get a new token
    //     await UserService()
    //         .refresh()
    //         .then((response) async {
    //       await TokenRepository().persistAccessToken(response.accessToken);
    //       accessToken = response.accessToken;
    //     }).catchError((error, stackTrace) {
    //       handler.reject(error, true);
    //     }).whenComplete(() => dio.interceptors.requestLock.unlock());
    //   }

    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
