// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/mixin/network_json_view_mixin.dart';
import 'package:vexana_inspector/src/utility/string_values.dart';

final class NetworkJsonView extends StatefulWidget {
  const NetworkJsonView({
    required this.apiModel,
    super.key,
  });
  final ApiModel apiModel;
  @override
  State<NetworkJsonView> createState() => _NetworkJsonViewState();
}

class _NetworkJsonViewState extends State<NetworkJsonView>
    with NetworkJsonViewMixin {
  String get _pathFromApiModel => Uri.parse(widget.apiModel.url).path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: FittedBox(
          child: Text(
            _pathFromApiModel,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<void>(
                  child: TextButton(
                    onPressed: shareJsonBody,
                    child: const Text(StringValues.shareJsonTitle),
                  ),
                ),
                PopupMenuItem<void>(
                  child: TextButton(
                    onPressed: shareCurlBody,
                    child: const Text(StringValues.shareCurlTitle),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  text: 'Response',
                ),
                Tab(
                  text: 'Request',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  JsonView.string(
                    responseBody,
                  ),
                  JsonView.map(
                    makeARequestString,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
