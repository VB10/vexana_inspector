// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class ApiModel extends Equatable {
  const ApiModel({
    required this.url,
    required this.method,
    required this.headers,
    required this.body,
    required this.status,
    required this.time,
  });

  String get name => '$url/$method';
  final String url;
  final String method;
  final Map<String, dynamic> headers;
  final String body;
  final int status;
  final DateTime time;

  @override
  List<Object> get props {
    return [
      url,
      method,
      headers,
      body,
      status,
      time,
    ];
  }

  ApiModel copyWith({
    String? url,
    String? method,
    Map<String, dynamic>? headers,
    String? body,
    int? status,
    DateTime? time,
  }) {
    return ApiModel(
      url: url ?? this.url,
      method: method ?? this.method,
      headers: headers ?? this.headers,
      body: body ?? this.body,
      status: status ?? this.status,
      time: time ?? this.time,
    );
  }
}
