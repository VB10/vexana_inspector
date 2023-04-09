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
    super.onRequest(options, handler);
    onRequestChanged.call(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    onResponseChanged.call(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    onErrorChanged.call(err);
  }
}
