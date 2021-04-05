import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_18_aws_amplify/models/ModelProvider.dart';
import 'package:flutter_18_aws_amplify/models/loading_view.dart';
import 'package:flutter_18_aws_amplify/todo_bloc.dart';
import 'package:flutter_18_aws_amplify/todo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'amplifyconfiguration.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context)=> TodoCubit()..getTodo(),
          child: _amplifyConfigured? TodoView():LoadingView()),
    );
  }
  @override


  void _configureAmplify() async {

    Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));
    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print(e);
    }
    setState(() {
      _amplifyConfigured = true;

    });
  }
}
