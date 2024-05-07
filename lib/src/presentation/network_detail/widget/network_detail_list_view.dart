import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/network_detail/cubit/network_detail_state.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_json_view.dart';
import 'package:vexana_inspector/src/presentation/network_detail/widget/status_color_box.dart';

@immutable

/// NetworkListView is a view that shows the network requests.
final class NetworkListView extends StatelessWidget {
  /// Creates a [NetworkListView] widget.
  const NetworkListView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<NetworkDetailCubit>().state.theme;

    return BlocSelector<NetworkDetailCubit, NetworkDetailState, List<ApiModel>>(
      selector: (state) => state.searchItems.reversed.toList(),
      builder: (context, items) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: theme.cardTextColor,
          ),
          itemCount: items.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: context.padding.low,
              child: Row(
                children: [
                  StatusColorBox(statusCode: item.status),
                  Expanded(
                    child: _ResponseCard(item: item),
                  ),
                  Text(
                    '${index + 1}',
                    style: context.general.textTheme.titleSmall?.copyWith(
                      color: theme.cardTextColor,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

final class _ResponseCard extends StatelessWidget {
  const _ResponseCard({
    required this.item,
  });

  final ApiModel item;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<NetworkDetailCubit>().state.theme;

    return ListTile(
      title: Text(item.url),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                item.method,
                style: context.general.textTheme.titleSmall
                    ?.copyWith(color: theme.cardTextColor),
              ),
              Padding(
                padding: context.padding.onlyLeftLow,
                child: Text(
                  item.status.toString(),
                  style: context.general.textTheme.titleSmall
                      ?.copyWith(color: theme.cardTextColor),
                ),
              ),
            ],
          ),
          Text(
            TimeOfDay.fromDateTime(item.time).format(context),
            style: context.general.textTheme.titleSmall
                ?.copyWith(color: theme.cardTextColor),
          ),
        ],
      ),
      onTap: () {
        context.route.navigateToPage(
          NetworkJsonView(apiModel: item),
        );
      },
    );
  }
}
