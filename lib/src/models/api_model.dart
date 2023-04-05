// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ApiModel extends Equatable {
  const ApiModel({
    required this.name,
    required this.url,
    required this.method,
    required this.headers,
    required this.body,
  });

  final String name;
  final String url;
  final String method;
  final Map<String, dynamic> headers;
  final String body;

  @override
  List<Object> get props {
    return [
      name,
      url,
      method,
      headers,
      body,
    ];
  }
}
