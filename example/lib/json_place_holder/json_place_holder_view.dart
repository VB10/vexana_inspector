import 'package:flutter/material.dart';
import 'package:vexana_inspector/vexana_inspector.dart';
import './json_place_holder_view_model.dart';

class JsonPlaceHolderView extends JsonPlaceHolderViewModel {
  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('inspector'),
        ),
        onPressed: () {
          InspectorManager.open();
        },
      ),
      appBar: buildAppBar(),
      body: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => Text(posts[index].title ?? ''),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            InspectorManager.open();
          },
          icon: const Icon(Icons.network_check),
        )
      ],
      title: isLoading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : const Text('Vexana Project'),
    );
  }
}
