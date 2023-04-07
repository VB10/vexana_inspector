// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/utility/manager/http_logger_manager.dart';

class NetworkJsonView extends StatefulWidget {
  const NetworkJsonView({
    super.key,
    required this.apiModel,
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
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      Share.share(widget.apiModel.body);
                    },
                    child: const Text('Share Json body'),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      Share.share(
                        HttpLoggerManager.makeCurlString(widget.apiModel),
                      );
                    },
                    child: const Text('Share Curl'),
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
