import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana_inspector/src/core/inspector_manager.dart';
import 'package:vexana_inspector/src/models/api_model.dart';
import 'package:vexana_inspector/src/presentation/cubit/network_detail_cubit.dart';

class NetworkDetailView extends StatefulWidget {
  const NetworkDetailView({super.key, required this.child});

  final Widget child;
  @override
  State<NetworkDetailView> createState() => _NetworkDetailViewState();
}

class _NetworkDetailViewState extends State<NetworkDetailView> {
  late final NetworkDetailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = NetworkDetailCubit(InspectorManager.instance);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<NetworkDetailCubit, NetworkDetailState>(
        listener: (context, state) {
          if (state.isDetailPage ?? false) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Test(items: state.items),
            ));
          }
        },
        child: widget.child,
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key, required this.items});
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
          return ListTile(
            title: Text(item.url),
            subtitle: Text(item.method),
            onTap: () {
              // context.read<NetworkDetailCubit>().openDetail();
            },
          );
        },
      ),
    );
  }
}
