import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:vexana_inspector/src/core/inspector_detail.dart';
import 'package:vexana_inspector/src/presentation/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/cubit/network_detail_state.dart';
import 'package:vexana_inspector/src/presentation/view/network_inspect_view.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

/// NetworkDetailView is a widget that wraps your app and provides a way to
/// inspect network requests.
class NetworkDetailView extends StatefulWidget {
  /// Creates a [NetworkDetailView] widget.
  /// [child] is the widget that will be wrapped by [NetworkDetailView].
  /// [isEnableShake] is the option to enable shake gesture to open inspector.
  const NetworkDetailView({
    required this.child,
    this.isEnableShake,
    super.key,
  });

  /// Child widget your root widget
  final Widget child;

  /// Enable shake gesture to open inspector
  final bool? isEnableShake;
  @override
  State<NetworkDetailView> createState() => _NetworkDetailViewState();
}

class _NetworkDetailViewState extends State<NetworkDetailView> {
  late final NetworkDetailCubit _cubit;
  late final NavigatorObserver _navigatorObserver;

  @override
  void initState() {
    super.initState();
    _cubit = NetworkDetailCubit();
    InspectorDetail.instance.update(_cubit);
    _navigatorObserver = InspectorManager.navigatorObserver;
    _checkShakeAbility();
  }

  void _checkShakeAbility() {
    final isEnableShake = widget.isEnableShake ?? false;
    if (!isEnableShake) return;
    ShakeDetector.autoStart(
      onPhoneShake: _cubit.openDetail,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<NetworkDetailCubit, NetworkDetailState>(
        listener: (context, state) async {
          if (state.isDetailPage ?? false) {
            final navigator = _navigatorObserver.navigator;
            if (navigator == null) {
              return;
            }
            final _ = await navigator.push<void>(
              MaterialPageRoute<void>(
                builder: (context) => NetworkInspectView(
                  cubit: _cubit,
                ),
              ),
            );
            _cubit.closeDetail();
          }
        },
        child: widget.child,
      ),
    );
  }
}
