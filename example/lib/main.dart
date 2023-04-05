import 'package:example/json_place_holder/json_place_holder.dart';
import 'package:flutter/material.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkDetailView(
      child: MaterialApp(
        navigatorObservers: [InspectorManager.navigatorObserver],
        title: 'Material App',
        home: const JsonPlaceHolder(),
      ),
    );
  }
}
