import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/utility/extension/int_color_extension.dart';

class StatusColorBox extends StatelessWidget {
  const StatusColorBox({super.key, required this.statusCode});
  final int statusCode;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: statusCode.color,
      child: SizedBox(
        width: context.dynamicWidth(0.02),
        height: context.dynamicHeight(0.1),
      ),
    );
  }
}
