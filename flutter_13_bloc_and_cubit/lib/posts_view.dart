import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          centerTitle: true,
        ),
      ),
    );
  }
}
