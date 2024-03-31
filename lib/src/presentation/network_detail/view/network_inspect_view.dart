import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/network_detail/widget/network_detail_list_view.dart';
import 'package:vexana_inspector/src/utility/string_values.dart';

@immutable

/// NetworkInspectView is a view that shows the network requests.
final class NetworkInspectView extends StatelessWidget {
  /// It takes a [NetworkDetailCubit] as a parameter.
  /// Cubit is used to get the network requests.
  const NetworkInspectView({
    required this.cubit,
    super.key,
  });

  /// Cubit is provide by network api response
  final NetworkDetailCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text(StringValues.networkDetail),
              pinned: true,
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.route.pop();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: context.padding.normal,
                child: TextField(
                  onChanged: cubit.search,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ],
          body: const NetworkListView(),
        ),
      ),
    );
  }
}
