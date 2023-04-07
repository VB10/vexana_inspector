import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/cubit/network_detail_cubit.dart';
import 'package:vexana_inspector/src/presentation/cubit/network_detail_state.dart';
import 'package:vexana_inspector/src/presentation/view/network_json_view.dart';
import 'package:vexana_inspector/src/presentation/widget/status_color_box.dart';
import 'package:vexana_inspector/src/utility/string_values.dart';

class NetworkInspectView extends StatelessWidget {
  const NetworkInspectView({super.key, required this.cubit});
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
              expandedHeight: 120,
              pinned: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  cubit.navigatorObserver.navigator?.pop();
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Align(
                  alignment: Alignment.bottomCenter,
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
            ),
          ],
          body: const _NetworkListView(),
        ),
      ),
    );
  }
}

class _NetworkListView extends StatelessWidget {
  const _NetworkListView();

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
                        context.navigateToPage(
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
