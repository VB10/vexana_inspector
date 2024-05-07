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
          _PopupShareButton(
            onShareJsonBodyPressed: shareJsonBody,
            onShareCurlBodyPressed: shareCurlBody,
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const _TabBar(),
            Expanded(
              child: _TabBody(
                responseBody: responseBody,
                makeARequestString: makeARequestString,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _PopupShareButton extends StatelessWidget {
  const _PopupShareButton({
    required this.onShareJsonBodyPressed,
    required this.onShareCurlBodyPressed,
  });

  final VoidCallback onShareJsonBodyPressed;
  final VoidCallback onShareCurlBodyPressed;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem<void>(
            child: TextButton(
              onPressed: onShareJsonBodyPressed,
              child: const Text(StringValues.shareJsonTitle),
            ),
          ),
          PopupMenuItem<void>(
            child: TextButton(
              onPressed: onShareCurlBodyPressed,
              child: const Text(StringValues.shareCurlTitle),
            ),
          ),
        ];
      },
    );
  }
}

final class _TabBar extends StatelessWidget {
  const _TabBar();

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          text: StringValues.responseTitle,
        ),
        Tab(
          text: StringValues.requestTitle,
        ),
      ],
    );
  }
}

final class _TabBody extends StatelessWidget {
  const _TabBody({
    required this.responseBody,
    required this.makeARequestString,
  });

  final String responseBody;
  final Map<String, dynamic> makeARequestString;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        JsonView.string(
          responseBody,
        ),
        JsonView.map(
          makeARequestString,
        ),
      ],
    );
  }
}
