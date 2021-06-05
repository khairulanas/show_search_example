import 'package:flutter/material.dart';
import 'package:show_search_example/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example App'),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: SearchScreen(),
            ),
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
