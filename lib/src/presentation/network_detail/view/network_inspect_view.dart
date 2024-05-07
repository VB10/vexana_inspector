import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/network_detail/widget/network_detail_list_view.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';
import 'package:vexana_inspector/src/utility/string_values.dart';

@immutable

/// NetworkInspectView is a view that shows the network requests.
final class NetworkInspectView extends StatefulWidget {
  /// It takes a [NetworkDetailCubit] as a parameter.
  /// Cubit is used to get the network requests.
  const NetworkInspectView({
    required this.cubit,
    super.key,
  });

  /// Cubit is provide by network api response
  final NetworkDetailCubit cubit;

  @override
  State<NetworkInspectView> createState() => _NetworkInspectViewState();
}

class _NetworkInspectViewState extends State<NetworkInspectView>
    with _NetworkInspectorViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: Scaffold(
        backgroundColor: _theme.backgroud,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text(StringValues.networkDetail),
              pinned: true,
              backgroundColor: _theme.searchBackgroud,
              leading: _Back(theme: _theme),
            ),
            SliverToBoxAdapter(
              child: _Search(theme: _theme),
            ),
          ],
          body: const NetworkListView(),
        ),
      ),
    );
  }
}

mixin _NetworkInspectorViewMixin on State<NetworkInspectView> {
  late final ProductTheme _theme;

  @override
  void initState() {
    super.initState();
    _theme = widget.cubit.state.theme;
  }
}

final class _Search extends StatelessWidget {
  const _Search({
    required ProductTheme theme,
  }) : _theme = theme;

  final ProductTheme _theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: TextField(
        onChanged: context.read<NetworkDetailCubit>().search,
        decoration: InputDecoration(
          fillColor: _theme.searchBackgroud,
          filled: true,
          hintText: StringValues.searchHint,
          hintStyle: TextStyle(color: _theme.searchTextColor.withOpacity(.4)),
          prefixIcon: Icon(
            Icons.search,
            color: _theme.searchTextColor,
          ),
        ),
      ),
    );
  }
}

final class _Back extends StatelessWidget {
  const _Back({
    required ProductTheme theme,
  }) : _theme = theme;

  final ProductTheme _theme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: _theme.searchTextColor,
      ),
      onPressed: () {
        context.route.pop();
      },
    );
  }
}
