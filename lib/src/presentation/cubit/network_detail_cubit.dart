import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/cubit/network_detail_state.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

class NetworkDetailCubit extends Cubit<NetworkDetailState> {
  NetworkDetailCubit(InspectorManager inspectorManager)
      : super(const NetworkDetailState()) {
    inspectorManager.update(this);
  }

  late NavigatorObserver navigatorObserver;

  void addResponse(Response<dynamic> item) {
    final currentItems = state.items.toList();
    final uriWithName =
        '${item.requestOptions.uri}/${item.requestOptions.method}';
    final index = currentItems.indexOrNull(
      (element) =>
          element.name == uriWithName && element.status == HttpStatus.continue_,
    );

    if (index != null) {
      final model = currentItems[index].copyWith(
        status: item.statusCode ?? HttpStatus.notFound,
        body: jsonEncode(item.data),
        time: DateTime.now(),
      );
      currentItems[index] = model;
      emit(state.copyWith(items: currentItems, searchItems: currentItems));
      return;
    }
  }

  void addRequest(RequestOptions item) {
    final model = ApiModel(
      time: DateTime.now(),
      url: item.uri.toString(),
      method: item.method,
      headers: item.headers,
      body: item.data.toString(),
      status: HttpStatus.continue_,
    );

    final currentItems = state.items.toList();
    final newItems = [...currentItems, model];
    emit(state.copyWith(items: newItems, searchItems: newItems));
  }

  void search(String text) {
    if (text.isEmpty) {
      emit(state.copyWith(searchItems: state.items));
      return;
    }

    final searchItems = state.items.where((element) {
      return element.url.toLowerCase().contains(text.toLowerCase());
    }).toList();

    emit(state.copyWith(searchItems: searchItems));
  }

  void openDetail() {
    emit(state.copyWith(isDetailPage: true));
  }

  void closeDetail() {
    emit(
      state.copyWith(
        isDetailPage: false,
      ),
    );
  }

  void updateObserver(NavigatorObserver navigatorObserver) {
    this.navigatorObserver = navigatorObserver;
  }
}
