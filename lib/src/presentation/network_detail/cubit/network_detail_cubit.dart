import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_state.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

/// It manage network detail page
final class NetworkDetailCubit extends Cubit<NetworkDetailState> {
  /// Set [InspectorManager] for manage network detail page
  NetworkDetailCubit() : super(const NetworkDetailState());

  /// Update theme for network detail page
  void updateTheme(ProductTheme theme) {
    emit(state.copyWith(theme: theme));
  }

  /// Adds a network response to the state
  void addNetworkResponse(Response<dynamic> item) {
    final currentItems = state.responseItems.toList();
    final apiModelItem = _findItem(item.requestOptions);

    if (apiModelItem == null) return;
    final model = apiModelItem.copyWith(
      status: item.statusCode ?? HttpStatus.notFound,
      body: jsonEncode(item.data),
      time: DateTime.now(),
    );
    final currentResponses = currentItems.toList()..add(model);
    emit(
      state.copyWith(
        responseItems: currentResponses,
        searchItems: currentItems,
      ),
    );
  }

  /// Adds a network error to the state

  void addNetworkError(DioException item) {
    final currentItems = state.responseItems.toList();
    final apiModelItem = _findItem(item.requestOptions);
    if (apiModelItem == null) return;
    final model = apiModelItem.copyWith(
      status: item.response?.statusCode ?? HttpStatus.notFound,
      body: jsonEncode(item.response?.data),
      time: DateTime.now(),
    );
    final items = currentItems.toList()..add(model);
    emit(
      state.copyWith(
        responseItems: items,
        searchItems: currentItems,
      ),
    );
    return;
  }

  /// Adds a new [ApiModel] to the current list of network requests.

  void addNetworkRequest(RequestOptions item) {
    final model = ApiModel(
      time: DateTime.now(),
      url: item.uri.toString(),
      method: item.method,
      headers: item.headers,
      body: item.data.toString(),
      status: HttpStatus.continue_,
    );

    final currentItems = state.requestItems.toList()..add(model);

    emit(
      state.copyWith(
        requestItems: currentItems,
      ),
    );
  }

  /// This method searches the list of network request for the search term
  void search(String text) {
    if (text.isEmpty) {
      emit(state.copyWith(searchItems: state.responseItems));
      return;
    }

    final searchItems = state.responseItems.where((element) {
      return element.url.toLowerCase().contains(text.toLowerCase());
    }).toList();

    emit(state.copyWith(searchItems: searchItems));
  }

  /// Open the detail page.
  void openDetail() {
    if (state.isDetailPage ?? false) return;
    emit(state.copyWith(isDetailPage: true));
  }

  /// Closes the detail page.
  void closeDetail() {
    emit(
      state.copyWith(isDetailPage: false),
    );
  }

  ApiModel? _findItem(RequestOptions requestOptions) {
    final currentItems = state.requestItems.toList();
    final uriWithName = '${requestOptions.uri}/${requestOptions.method}';
    final index = currentItems.ext.indexOrNull(
      (element) =>
          element.name == uriWithName && element.status == HttpStatus.continue_,
    );

    if (index == null) return null;
    return currentItems[index];
  }
}
