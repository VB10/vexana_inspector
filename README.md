Applications with basic implementation will be able to access dashboards for network requests made by this library.

## Features

## Dashboard open

Once the implementation is complete, you can just call the open function with the inspector instance.

```dart
    InspectorManager.open();
```

### Dashboard open with shake

The dashboard can also be opened by shaking.

```dart
   NetworkDetailView(
      isEnableShake: true,
      child: MaterialApp(
        ..
      ),);
```

## Getting started

It's as simple as implementing these steps in the package you're using. Basically, it watches your network requests.

> You must install [Vexana](https://pub.dev/packages/vexana) before you can use this package.

## Usage

Add widgets that represent your root view or what you want to listen to. After that, create a material widget with a navigation observer property.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkDetailView(
      isEnableShake: true,
      child: MaterialApp(
        navigatorObservers: [InspectorManager.navigatorObserver],
        title: 'Material App',
        home: const JsonPlaceHolder(),
      ),
    );
  }
}

```

This code can [InspectorManager.open();] the dashboard anywhere, for example, on double tapping or right swiping.

```dart
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        final velocity = details.primaryVelocity ?? 0;
        if (velocity > 0) {
          // User swiped Left
        } else if (velocity < 0) {
          // User swiped Right
          InspectorManager.open();
        }
      },
      onTertiaryTapUp: (tapDetails) {
        InspectorManager.open();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getAllPosts();
            // InspectorManager.open();
          },
        ),
        appBar: buildAppBar(),
        body: buildListView(),
      ),
    );
  }
```

## Additional information

Please add your thoughts to an issue or PR review and I will merge it as soon as possible.

## License

MIT License

Copyright (c) [2023] [Veli Bacik]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
