import 'package:vexana_inspector/src/presentation/cubit/network_detail_cubit.dart';

/// This class is a singleton that is used to access the NetworkDetailCubit
/// instance. This is needed so that we can access the NetworkDetailCubit
/// instance from the NavigatorObserver without having to pass it to all of
/// the pages that need it.

class InspectorDetail {
  InspectorDetail._();

  /// The [InspectorDetail] that should be used when the user requests the
  /// highest level of detail.
  ///
  /// This is the default value returned by [InspectorService.getDetailsSubtree].

  static final InspectorDetail instance = InspectorDetail._();

  late NetworkDetailCubit _networkDetailCubit;

  /// This is a getter that returns the _networkDetailCubit object.
  /// It is used to get the current state of the network detail screen
  NetworkDetailCubit get networkDetailCubit => _networkDetailCubit;

  /// Update the cubit with the new NetworkDetailCubit when load widget
  void update(NetworkDetailCubit value) {
    _networkDetailCubit = value;
  }
}
