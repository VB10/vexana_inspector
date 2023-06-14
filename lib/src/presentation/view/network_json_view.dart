// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/utility/manager/http_logger_manager.dart';
import 'package:vexana_inspector/src/utility/string_values.dart';

class NetworkJsonView extends StatefulWidget {
  const NetworkJsonView({
    required this.apiModel,
    super.key,
  });
  final ApiModel apiModel;
  @override
  State<NetworkJsonView> createState() => _NetworkJsonViewState();
}

class _NetworkJsonViewState extends State<NetworkJsonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: FittedBox(
          child: Text(
            widget.apiModel.name,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<void>(
                  child: TextButton(
                    onPressed: () async {
                      await widget.apiModel.body.share();
                      if (!mounted) return;
                      await context.pop();
                    },
                    child: const Text(StringValues.shareJsonTitle),
                  ),
                ),
                PopupMenuItem<void>(
                  child: TextButton(
                    onPressed: () async {
                      await HttpLoggerManager.makeCurlString(widget.apiModel)
                          .share();

                      if (!mounted) return;
                      await context.pop();
                    },
                    child: const Text(StringValues.shareCurlTitle),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: JsonView.string(widget.apiModel.body),
    );
  }
}
