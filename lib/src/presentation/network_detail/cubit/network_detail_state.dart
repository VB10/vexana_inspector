import 'package:equatable/equatable.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/theme/basic_product_theme.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';

/// Network detail state for network detail page
final class NetworkDetailState extends Equatable {
  /// Network detail state constructor
  const NetworkDetailState({
    this.items = const [],
    this.isDetailPage,
    this.searchItems = const [],
    this.theme = const BasicProductTheme(),
  });

  /// List of [ApiModel] items
  final List<ApiModel> items;

  /// Is detail page
  final bool? isDetailPage;

  /// List of [ApiModel] search items
  final List<ApiModel> searchItems;

  final ProductTheme theme;

  @override
  List<Object> get props => [items, isDetailPage ?? false, searchItems, theme];

  /// Copy with new values
  NetworkDetailState copyWith({
    List<ApiModel>? items,
    bool? isDetailPage,
    List<ApiModel>? searchItems,
    ProductTheme? theme,
  }) {
    return NetworkDetailState(
      items: items ?? this.items,
      isDetailPage: isDetailPage,
      searchItems: searchItems ?? this.searchItems,
      theme: theme ?? this.theme,
    );
  }
}
