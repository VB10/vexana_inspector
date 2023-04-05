// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'network_detail_cubit.dart';

class NetworkDetailState extends Equatable {
  const NetworkDetailState({this.items = const [], this.isDetailPage});

  final List<ApiModel> items;
  final bool? isDetailPage;

  @override
  List<Object> get props => [items, isDetailPage ?? false];

  NetworkDetailState copyWith({
    List<ApiModel>? items,
    bool? isDetailPage,
  }) {
    return NetworkDetailState(
      items: items ?? this.items,
      isDetailPage: isDetailPage ?? this.isDetailPage,
    );
  }
}
