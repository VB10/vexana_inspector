import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/utility/extension/int_color_extension.dart';

/// StatusColorBox is a widget that wraps your app and provides a way to
final class StatusColorBox extends StatelessWidget {
  /// Creates a [StatusColorBox] widget.
  const StatusColorBox({required this.statusCode, super.key});

  /// Status code
  final int statusCode;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: statusCode.color,
      child: SizedBox(
        width: context.sized.dynamicWidth(0.02),
        height: context.sized.dynamicHeight(0.1),
      ),
    );
  }
}
