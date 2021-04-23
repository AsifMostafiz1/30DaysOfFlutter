import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_18_aws_amplify/LoadingView.dart';
import 'package:flutter_18_aws_amplify/app_navigator.dart';
import 'package:flutter_18_aws_amplify/auth_cubit.dart';
import 'package:flutter_18_aws_amplify/todo_cubit.dart';
import 'package:flutter_18_aws_amplify/todo_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';


void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _amplifyConfigured = false;
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthCubit(),
          child: _amplifyConfigured?TodoHome():LoadingView()),
    );
  }

  void _configureAmplify() async {




    try {
      await Future.wait([
      Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance)),
      Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyAuthCognito())
      ]);
      await Amplify.configure(amplifyconfig);

      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }


  }
}
