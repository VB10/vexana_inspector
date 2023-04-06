import 'package:flutter/material.dart';

extension HttpStatusCodeExtension on int {
  bool get isSuccessful => this >= 200 && this < 300;
  bool get isRedirection => this >= 300 && this < 400;
  bool get isClientError => this >= 400 && this < 500;
  bool get isServerError => this >= 500 && this < 600;

  Color get color {
    if (isSuccessful) {
      return Colors.green;
    } else if (isRedirection) {
      return Colors.blue;
    } else if (isClientError) {
      return Colors.orange;
    } else if (isServerError) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
