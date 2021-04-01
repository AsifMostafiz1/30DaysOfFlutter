import 'package:flutter/material.dart';
import 'package:flutter_13_bloc_and_cubit/post_cubit.dart';
import 'package:flutter_13_bloc_and_cubit/post_view.dart';
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
      home: BlocProvider<PostBloc>
        (create: (context)=> PostBloc()..add(LoadPostEvent()),child: PostView()),
    );
  }
}
