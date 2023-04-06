import 'package:flutter/foundation.dart';
import 'package:vexana_inspector/src/models/api_model.dart';

@immutable
class HttpLoggerManager {
  const HttpLoggerManager._();

  /// This function generates the curl command to be executed by the user.
  /// It uses the model to generate the curl command using the values of
  /// the model.
  static String makeCurlString(ApiModel apiModel) {
    // Create a map with the headers
    final headers =
        apiModel.headers.map((key, value) => MapEntry(key, '$key: $value'));
    // Create a string with the headers
    final headerString =
        headers.entries.map((e) => "-H '${e.value}'").join(' ');
    // Create a string with the body
    final bodyString = apiModel.body.isNotEmpty ? "-d '${apiModel.body}' " : '';

    // Create the curl string
    return "curl -X ${apiModel.method} '${apiModel.url}' $headerString $bodyString";
  }
}
