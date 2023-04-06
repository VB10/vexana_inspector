import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana_inspector/src/core/inspector_manager.dart';
import 'package:vexana_inspector/src/presentation/cubit/network_detail_cubit.dart';

import 'package:vexana_inspector/src/presentation/view/network_inspect_view.dart';

class NetworkDetailView extends StatefulWidget {
  const NetworkDetailView({super.key, required this.child});

  final Widget child;
  @override
  State<NetworkDetailView> createState() => _NetworkDetailViewState();
}

class _NetworkDetailViewState extends State<NetworkDetailView> {
  late final NetworkDetailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = NetworkDetailCubit(InspectorManager.instance);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<NetworkDetailCubit, NetworkDetailState>(
        listener: (context, state) {
          if (state.isDetailPage ?? false) {
            final navigator = _cubit.navigatorObserver.navigator;
            if (navigator == null) {
              return;
            }
            navigator.push(
              MaterialPageRoute<void>(
                builder: (context) => NetworkInspectView(items: state.items),
              ),
            );
          }
        },
        child: widget.child,
      ),
    );
  }
}
