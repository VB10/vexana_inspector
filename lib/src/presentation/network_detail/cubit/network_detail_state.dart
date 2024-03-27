// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:vexana_inspector/src/models/api_model.dart';

/// Network detail state for network detail page
final class NetworkDetailState extends Equatable {
  const NetworkDetailState({
    this.items = const [],
    this.isDetailPage,
    this.searchItems = const [],
  });

  /// List of [ApiModel] items
  final List<ApiModel> items;

  /// Is detail page
  final bool? isDetailPage;

  /// List of [ApiModel] search items
  final List<ApiModel> searchItems;

  @override
  List<Object> get props => [items, isDetailPage ?? false, searchItems];

  /// Copy with new values
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
