import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/view/network_json_view.dart';
import 'package:vexana_inspector/src/presentation/widget/status_color_box.dart';

class NetworkInspectView extends StatelessWidget {
  const NetworkInspectView({super.key, required this.items});
  final List<ApiModel> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Detail'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            // color: item.isSuccess ? Colors.green : Colors.red,
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
                        Text(TimeOfDay.fromDateTime(item.time).format(context)),
                      ],
                    ),
                    onTap: () {
                      context.navigateToPage(NetworkJsonView(apiModel: item));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
