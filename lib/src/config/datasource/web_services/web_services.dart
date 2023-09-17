import 'package:dio/dio.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      // baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
    );
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
  }
}
