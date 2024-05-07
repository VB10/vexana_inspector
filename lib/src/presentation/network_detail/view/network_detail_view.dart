import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake_detector/shake_detector.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_state.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/mixin/network_detail_view_mixin.dart';
import 'package:vexana_inspector/src/presentation/theme/basic_product_theme.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';

/// NetworkDetailView is a widget that wraps your app and provides a way to
/// inspect network requests.
final class NetworkDetailView extends StatefulWidget {
  /// Creates a [NetworkDetailView] widget.
  /// [child] is the widget that will be wrapped by [NetworkDetailView].
  /// [isEnableShake] is the option to enable shake gesture to open inspector.
  const NetworkDetailView({
    required this.child,
    required bool? isEnableShake,
    required ProductTheme theme,
    super.key,
  })  : _isEnableShake = isEnableShake,
        _theme = theme;

  /// Child widget your root widget
  final Widget child;

  /// Enable shake gesture to open inspector
  final bool? _isEnableShake;

  /// You can define your own theme or use the default theme
  /// Default theme is [BasicProductTheme]
  final ProductTheme _theme;

  @override
  State<NetworkDetailView> createState() => _NetworkDetailViewState();
}

class _NetworkDetailViewState extends State<NetworkDetailView>
    with NetworkDetailViewMixin {
  /// Cubit instance theme
  @override
  ProductTheme get theme => widget._theme;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => networkDetailCubit,
      child: BlocListener<NetworkDetailCubit, NetworkDetailState>(
        listener: (context, state) => listenNetworkStateChanges(state),
        child: ShakeDetectWrap(
          enabled: widget._isEnableShake ?? false,
          onShake: onShakeTriggered,
          child: widget.child,
        ),
      ),
    );
  }
}
