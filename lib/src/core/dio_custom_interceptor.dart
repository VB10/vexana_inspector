import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Interceptor for logging request, response and error
final class DioCustomInterceptors extends Interceptor {
  /// Constructor for [DioCustomInterceptors]
  DioCustomInterceptors({
    required this.onResponseChanged,
    required this.onErrorChanged,
    required this.onRequestChanged,
  });

  /// Callback for response
  final ValueChanged<Response<dynamic>> onResponseChanged;

  /// Callback for error
  final ValueChanged<DioException> onErrorChanged;

  /// Callback for request
  final ValueChanged<RequestOptions> onRequestChanged;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    onRequestChanged.call(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    super.onResponse(response, handler);
    onResponseChanged.call(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    onErrorChanged.call(err);
  }
}
