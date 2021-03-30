import 'package:flutter/material.dart';
import 'package:flutter_13_bloc_and_cubit/post.dart';
import 'package:flutter_13_bloc_and_cubit/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<PostCubit>(create: (context)=>PostCubit()..getPost(),child: PostView()),
    );
  }
}
