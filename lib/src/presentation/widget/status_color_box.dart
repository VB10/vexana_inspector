import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/utility/extension/int_color_extension.dart';

class StatusColorBox extends StatelessWidget {
  const StatusColorBox({required this.statusCode, super.key});
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
