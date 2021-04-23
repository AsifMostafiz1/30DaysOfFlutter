
import 'package:flutter/cupertino.dart';
import 'package:flutter_18_aws_amplify/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
abstract class AuthState{}

class UnknownState extends AuthState{}

class AuthenticationState extends AuthState{
  String userId;
  AuthenticationState({this.userId});
}

class UnAuthenticationState extends AuthState{}

class AuthCubit extends Cubit<AuthState>{
  AuthCubit(): super(UnknownState());
  final authRepo = AuthRepository();

  void signIn() async{
    final userId = await authRepo.webSignIn();
    try{
      if(userId!=null && userId.isNotEmpty){
        emit(AuthenticationState(userId: userId));
      }
      else{
        emit(UnAuthenticationState());
      }
    }on Exception{
      emit(UnAuthenticationState());
    }
  }
  void singOut() async{
    try{
      await authRepo.signOut();
    }on Exception{
        emit(UnAuthenticationState());
    }

  }

  void autoSignIn()async{
    final userId = await authRepo.autoSingIn();
    try{
      if(userId!=null && userId.isNotEmpty){
        emit(AuthenticationState(userId: userId));
      }
      else{
        emit(UnAuthenticationState());
      }
    }on Exception{
      emit(UnAuthenticationState());
    }
  }
}