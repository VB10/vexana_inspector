import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana_inspector/src/presentation/network_detail/view/network_json_view.dart';
import 'package:vexana_inspector/src/manager/http_logger_manager.dart';

/// NetworkJsonView is a widget that wraps your app and provides a way to
mixin NetworkJsonViewMixin on State<NetworkJsonView> {
  /// Share json body
  Future<void> shareJsonBody() async {
    await widget.apiModel.body.ext.share();
    if (!mounted) return;
    await context.route.pop();
  }

  /// Share curl body
  Future<void> shareCurlBody() async {
    await HttpLoggerManager.makeCurlString(widget.apiModel).ext.share();

    if (!mounted) return;
    await context.route.pop();
  }
}
