import 'package:flutter/material.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_detail_view.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

/// VexanaInspect is a widget that wraps your app and provides a way to
/// inspect network requests.
final class VexanaInspect extends StatelessWidget {
  /// Creates a [VexanaInspect] widget.
  const VexanaInspect({
    /// [child] is the widget that will be wrapped by [VexanaInspect].
    required this.child,

    /// [isShakeEnabled] is the option to enable shake gesture to open inspector
    this.isShakeEnabled = true,
    super.key,
  });

  /// Child widget your root widget
  final Widget child;

  /// Enable shake gesture to open inspector
  /// Default value is true
  final bool isShakeEnabled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        final velocity = details.primaryVelocity ?? 0;
        if (velocity > 0) {
          // User swiped Left
        } else if (velocity < 0) {
          // User swiped Right
          InspectorManager.open();
        }
      },
      onTertiaryTapUp: (tapDetails) {
        InspectorManager.open();
      },
      child: NetworkDetailView(isEnableShake: isShakeEnabled, child: child),
    );
  }
}
