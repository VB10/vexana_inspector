// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioCustomInterceptors extends Interceptor {
  final ValueChanged<Response<dynamic>> onResponseChanged;
  final ValueChanged<DioError> onErrorChanged;
  final ValueChanged<RequestOptions> onRequestChanged;
  DioCustomInterceptors({
    required this.onResponseChanged,
    required this.onErrorChanged,
    required this.onRequestChanged,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
    onRequestChanged.call(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
    onResponseChanged.call(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
    onErrorChanged.call(err);
  }
}
