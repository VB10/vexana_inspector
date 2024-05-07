import 'package:flutter/material.dart';
import 'package:vexana_inspector/src/core/inspector_detail.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_state.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_detail_view.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_inspect_view.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

/// NetworkDetailView is a widget that wraps your app and provides a way to
mixin NetworkDetailViewMixin on State<NetworkDetailView> {
  /// NetworkDetailCubit instance
  late final NetworkDetailCubit networkDetailCubit;

  /// NavigatorObserver instance
  late final NavigatorObserver navigatorObserver;

  /// ProductTheme instance
  ProductTheme get theme;
  @override
  void initState() {
    super.initState();
    networkDetailCubit = InspectorDetail.instance.networkDetailCubit;
    networkDetailCubit.updateTheme(theme);
    navigatorObserver = InspectorManager.navigatorObserver;
  }

  /// On shake triggered open detail page
  void onShakeTriggered() {
    networkDetailCubit.openDetail();
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
