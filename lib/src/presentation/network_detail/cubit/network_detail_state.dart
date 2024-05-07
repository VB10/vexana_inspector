import 'package:equatable/equatable.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/theme/basic_product_theme.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';

/// Network detail state for network detail page
final class NetworkDetailState extends Equatable {
  /// Network detail state constructor
  const NetworkDetailState({
    this.responseItems = const [],
    this.requestItems = const [],
    this.isDetailPage,
    this.searchItems = const [],
    this.theme = const BasicProductTheme(),
  });

  /// List of [ApiModel] repsonse items
  final List<ApiModel> responseItems;

  /// List of [ApiModel] request items
  final List<ApiModel> requestItems;

  /// Is detail page
  final bool? isDetailPage;

  /// List of [ApiModel] search items
  final List<ApiModel> searchItems;

  /// Product theme
  final ProductTheme theme;

  @override
  List<Object> get props => [
        responseItems,
        requestItems,
        isDetailPage ?? false,
        searchItems,
        theme,
      ];

  /// Copy with new values
  NetworkDetailState copyWith({
    List<ApiModel>? responseItems,
    List<ApiModel>? requestItems,
    bool? isDetailPage,
    List<ApiModel>? searchItems,
    ProductTheme? theme,
  }) {
    return NetworkDetailState(
      responseItems: responseItems ?? this.responseItems,
      requestItems: requestItems ?? this.requestItems,
      isDetailPage: isDetailPage,
      searchItems: searchItems ?? this.searchItems,
      theme: theme ?? this.theme,
    );
  }
}
