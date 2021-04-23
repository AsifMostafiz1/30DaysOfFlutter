import 'package:flutter/material.dart';
import 'package:flutter_18_aws_amplify/LoadingView.dart';
import 'package:flutter_18_aws_amplify/auth_cubit.dart';
import 'package:flutter_18_aws_amplify/auth_view.dart';
import 'package:flutter_18_aws_amplify/todo_cubit.dart';
import 'package:flutter_18_aws_amplify/todo_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
      return Navigator(
        pages: [
          if(state is UnknownState) MaterialPage(child: LoadingView()),
          if(state is AuthenticationState) MaterialPage(child:
              BlocProvider(
                create: (context) => TodoCubit()..getTodo()..observeTodos(),
                child: TodoHome(),
              )
          ),
          if(state is UnAuthenticationState) MaterialPage(child: TodoHome()),
        ],
        onPopPage: (route,result)=> route.didPop(result),
      );
    });
  }
}
