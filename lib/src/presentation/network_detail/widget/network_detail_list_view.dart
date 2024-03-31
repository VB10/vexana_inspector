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
    return BlocSelector<NetworkDetailCubit, NetworkDetailState, List<ApiModel>>(
      selector: (state) => state.searchItems.reversed.toList(),
      builder: (context, items) {
        return ListView.builder(
          itemCount: items.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: Row(
                children: [
                  StatusColorBox(statusCode: item.status),
                  Expanded(
                    child: ListTile(
                      title: Text(item.url),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(item.method),
                              const SizedBox(width: 8),
                              Text(item.status.toString()),
                            ],
                          ),
                          Text(
                            TimeOfDay.fromDateTime(item.time).format(context),
                          ),
                        ],
                      ),
                      onTap: () {
                        context.route.navigateToPage(
                          NetworkJsonView(apiModel: item),
                        );
                      },
                    ),
                  ),
                  Banner(
                    message: '${index + 1}',
                    location: BannerLocation.bottomEnd,
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
