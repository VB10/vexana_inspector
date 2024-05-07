import 'package:flutter/material.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_detail_view.dart';
import 'package:vexana_inspector/src/presentation/theme/basic_product_theme.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';

/// VexanaInspect is a widget that wraps your app and provides a way to
/// inspect network requests.
final class VexanaInspect extends StatelessWidget {
  /// Creates a [VexanaInspect] widget.
  const VexanaInspect({
    /// [child] is the widget that will be wrapped by [VexanaInspect].
    required this.child,

    /// [isShakeEnabled] is the option to enable shake gesture to open inspector
    this.isShakeEnabled = true,

    /// [theme] is the option to define your own theme or use the default theme
    this.theme = const BasicProductTheme(),
    super.key,
  });

  /// Child widget your root widget
  final Widget child;

  /// Enable shake gesture to open inspector
  /// Default value is true
  final bool isShakeEnabled;

  /// You can define your own theme or use the default theme
  /// Default theme is [BasicProductTheme]
  final ProductTheme theme;
  @override
  Widget build(BuildContext context) {
    return NetworkDetailView(
      isEnableShake: isShakeEnabled,
      theme: theme,
      child: child,
    );
  }
}
