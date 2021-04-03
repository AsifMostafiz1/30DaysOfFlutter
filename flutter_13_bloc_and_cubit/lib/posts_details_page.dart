import 'package:flutter/material.dart';
import 'package:flutter_13_bloc_and_cubit/app_navigator.dart';
import 'package:flutter_13_bloc_and_cubit/posts.dart';
class PostDetailsPage extends StatelessWidget {
  final Posts posts;

  PostDetailsPage({Key key,@required this.posts}): super(key: key);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: Text(posts.title),
        ),
        body: Center(
          child: Text(posts.body),
        ),
   );

  }
}
