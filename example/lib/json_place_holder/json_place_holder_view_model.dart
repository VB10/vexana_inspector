import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import 'package:vexana_inspector/vexana_inspector.dart';

import './json_place_holder.dart';
import 'model/post.dart';

abstract class JsonPlaceHolderViewModel extends State<JsonPlaceHolder> {
  List<Post> posts = [];

  late INetworkManager<EmptyModel> networkManager;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    networkManager = NetworkManager<EmptyModel>(
      isEnableLogger: true,
      noNetwork: NoNetwork(
        context,
      ),
      options: BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
    );

    networkManager.dioInterceptors.add(InspectorManager.instance.interceptor);
  }

  Future<void> getAllPosts() async {
    changeLoading();
    final response = await networkManager.send<Post, List<Post>>(
      '/posts',
      parseModel: Post(),
      method: RequestType.GET,
      isErrorDialog: true,
    );

    if (response.data is List) {
      posts = response.data ?? [];
    }

    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  //You can use this function for custom generate an error model.
  INetworkModel<Post> _errorModelFromData(Map<String, dynamic> data) {
    return Post.fromJson(data);
  }
}
