import 'package:flutter/material.dart';
import 'package:vexana_inspector/src/core/dio_custom_interceptor.dart';

import 'package:vexana_inspector/src/presentation/cubit/network_detail_cubit.dart';

@immutable
class InspectorManager {
  InspectorManager._();

  late NetworkDetailCubit _networkDetailCubit;
  static final NavigatorObserver navigatorObserver = NavigatorObserver();

  void update(NetworkDetailCubit value) {
    _networkDetailCubit = value;
    _networkDetailCubit.updateObserver(navigatorObserver);
  }

  static final InspectorManager instance = InspectorManager._();

  final interceptor = DioCustomInterceptors(
    onResponseChanged: (response) {
      instance._networkDetailCubit.addResponse(response);
    },
    onErrorChanged: (value) {},
    onRequestChanged: (value) {
      instance._networkDetailCubit.addRequest(value);
    },
  );

  void open() {
    _networkDetailCubit.openDetail();
  }
}
