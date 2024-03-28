// ignore_for_file: comment_references

import 'package:flutter/material.dart';
import 'package:vexana_inspector/src/core/dio_custom_interceptor.dart';

import 'package:vexana_inspector/src/core/inspector_detail.dart';

@immutable

/// It class helps to manage the network inspector
/// You just call the [InspectorManager.instance] to access the
/// [DioCustomInterceptors]
final class InspectorManager {
  InspectorManager._();

  /// Creates a new instance of the NavigatorObserver class.
  static final NavigatorObserver navigatorObserver = NavigatorObserver();

  /// Singleton instance of the InspectorManager class.
  static final InspectorManager instance = InspectorManager._();
  static final InspectorDetail _detail = InspectorDetail.instance;

  /// [DioCustomInterceptors] is a class that allows us to intercept
  /// the request,
  ///  response and error
  /// and we can use it to add to our cubit
  /// that way we can see the response and error in the detail screen.
  /// [onResponseChanged] and [onErrorChanged] will be called whenever there is
  ///  a response or error
  /// and we can add it to our cubit
  /// [onRequestChanged] will be called whenever there is a request
  /// and we can add it to our cubit
  final DioCustomInterceptors interceptor = DioCustomInterceptors(
    onResponseChanged: (response) {
      _detail.networkDetailCubit.addNetworkResponse(response);
    },
    onErrorChanged: (value) {
      _detail.networkDetailCubit.addNetworkError(value);
    },
    onRequestChanged: (value) {
      _detail.networkDetailCubit.addNetworkRequest(value);
    },
  );

  /// Opens the [NetworkDetailView] screen.
  /// Used to navigate to the network detail screen in response to
  /// tapping on a network in the network list.
  static void open() {
    _detail.networkDetailCubit.openDetail();
  }
}
