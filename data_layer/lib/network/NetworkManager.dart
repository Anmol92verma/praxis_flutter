import 'package:dio/dio.dart';

import 'Constants.dart';

class NetworkManager {
  Dio _dio;

  NetworkManager() {
    BaseOptions options = provideNetworkOptions();
    _dio = provideDioWithOptions(options);
    var loggingInterceptor = LogInterceptor(
        requestBody: true, responseBody: true);
    _dio.interceptors.add(loggingInterceptor);
  }

  Dio provideDioWithOptions(BaseOptions options) {
    return Dio(options);
  }

  BaseOptions provideNetworkOptions() {
    BaseOptions options =
    BaseOptions(receiveTimeout: 15000, connectTimeout: 15000);
    options.baseUrl = Constants.BASE_URL;
    return options;
  }
}
