import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vexana_inspector/src/models/api_model.dart';

import 'package:vexana_inspector/vexana_inspector.dart';

part 'network_detail_state.dart';

class NetworkDetailCubit extends Cubit<NetworkDetailState> {
  NetworkDetailCubit(InspectorManager inspectorManager) : super(const NetworkDetailState()) {
    inspectorManager.update(this);
  }

  late NavigatorObserver navigatorObserver;
  void addResponse(Response<dynamic> item) {}

  void addRequest(RequestOptions item) {
    final model = ApiModel(
      url: item.uri.toString(),
      method: item.method,
      headers: item.headers,
      body: item.data.toString(),
      name: '',
    );

    final currentItems = state.items;
    if (currentItems.any((element) => element.url == model.url)) {
      final index = currentItems.indexWhere((element) => element.url == model.url);
      currentItems[index] = model;
      emit(state.copyWith(items: currentItems));
      return;
    }

    emit(state.copyWith(items: [model]));
  }

  void openDetail() {
    navigatorObserver.navigator?.push(MaterialPageRoute(builder: (context) => Test(items: state.items)));

    // emit(state.copyWith(isDetailPage: true));
  }

  void updateObserver(NavigatorObserver navigatorObserver) {
    this.navigatorObserver = navigatorObserver;
  }
}
