import 'package:flutter/material.dart';
import 'package:vexana_inspector/vexana_inspector.dart';
import './json_place_holder_view_model.dart';

class JsonPlaceHolderView extends JsonPlaceHolderViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getAllPosts();
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
            InspectorManager.instance.open();
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
