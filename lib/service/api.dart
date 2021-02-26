import 'package:dio/dio.dart';

class API {
  static String baseURL = 'http://178.128.20.172:7328';
  static Dio dio;

  static Dio instance() {
    BaseOptions options = BaseOptions(baseUrl: API.baseURL);

    if (dio == null) {
      dio = Dio(options);
    }

    return dio;
  }
}
