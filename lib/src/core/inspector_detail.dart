// ignore_for_file: lines_longer_than_80_chars

import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_cubit.dart';

/// This class is a singleton that is used to access the NetworkDetailCubit
/// instance. This is needed so that we can access the NetworkDetailCubit
/// instance from the NavigatorObserver without having to pass it to all of
/// the pages that need it.

final class InspectorDetail {
  InspectorDetail._();

  /// The [InspectorDetail] that should be used when the user requests the
  /// highest level of detail.
  ///
  // ignore: comment_references
  /// This is the default value returned by [InspectorService.getDetailsSubtree].

  static final InspectorDetail instance = InspectorDetail._();

  late final NetworkDetailCubit _networkDetailCubit = NetworkDetailCubit();

  /// This is a getter that returns the _networkDetailCubit object.
  /// It is used to get the current state of the network detail screen
  NetworkDetailCubit get networkDetailCubit => _networkDetailCubit;
}
