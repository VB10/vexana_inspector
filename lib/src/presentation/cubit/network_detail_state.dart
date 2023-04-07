// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:vexana_inspector/src/models/api_model.dart';

class NetworkDetailState extends Equatable {
  const NetworkDetailState({
    this.items = const [],
    this.isDetailPage,
    this.searchItems = const [],
  });

  final List<ApiModel> items;
  final bool? isDetailPage;
  final List<ApiModel> searchItems;

  @override
  List<Object> get props => [items, isDetailPage ?? false, searchItems];

  NetworkDetailState copyWith({
    List<ApiModel>? items,
    bool? isDetailPage,
    List<ApiModel>? searchItems,
  }) {
    return NetworkDetailState(
      items: items ?? this.items,
      isDetailPage: isDetailPage,
      searchItems: searchItems ?? this.searchItems,
    );
  }
}
