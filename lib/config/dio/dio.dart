import 'package:dio/dio.dart';
import 'package:mobile_capstone_fpt/config/shared/shared_preferences.dart';

class DioClient {
  Dio configDio() {
    var options = BaseOptions(
      baseUrl: 'http://192.168.1.64:2204/',
      connectTimeout: 5000,
    );
    final dio = Dio(options);
    AppPreference appPreferences = AppPreference();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // String token = await appPreferences.getToken();
      //Check baseUrl
      String token = "hahah";
      if (token != '') {
        // options.headers[Label.authorization] = 'Bearer ' + token;
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
    return dio;
  }

  Dio get getDio => configDio();
}
