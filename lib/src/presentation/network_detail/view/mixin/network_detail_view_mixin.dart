import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:vexana_inspector/src/core/inspector_detail.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_state.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_detail_view.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_inspect_view.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

/// NetworkDetailView is a widget that wraps your app and provides a way to
mixin NetworkDetailViewMixin on State<NetworkDetailView> {
  /// NetworkDetailCubit instance
  late final NetworkDetailCubit networkDetailCubit;

  /// NavigatorObserver instance
  late final NavigatorObserver navigatorObserver;

  @override
  void initState() {
    super.initState();
    networkDetailCubit = InspectorDetail.instance.networkDetailCubit;
    navigatorObserver = InspectorManager.navigatorObserver;
    _checkShakeAbility();
  }

  void _checkShakeAbility() {
    final isEnableShake = widget.isEnableShake ?? false;
    if (!isEnableShake) return;
    ShakeDetector.autoStart(onPhoneShake: networkDetailCubit.openDetail);
  }

  /// Listen network state changes
  Future<void> listenNetworkStateChanges(NetworkDetailState state) async {
    if (state.isDetailPage ?? false) {
      final navigator = navigatorObserver.navigator;
      if (navigator == null) {
        return;
      }
      final _ = await navigator.push<void>(
        MaterialPageRoute<void>(
          builder: (context) => NetworkInspectView(cubit: networkDetailCubit),
        ),
      );
      networkDetailCubit.closeDetail();
    }
  }
}
