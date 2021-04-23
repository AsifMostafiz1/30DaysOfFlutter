import 'package:flutter_18_aws_amplify/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todoREpository.dart';

abstract class TodoState{}

class LoadingState extends TodoState{}

class ShowTodoSuccessState extends TodoState{
  final List<Todo>  todos;
  ShowTodoSuccessState({this.todos});
}

class ShowTodoFailureState extends TodoState{
  final Exception exception;

  ShowTodoFailureState(this.exception);
}


class TodoCubit extends Cubit<TodoState>{
  final _todoRepo = TodoRepository();
  TodoCubit(): super(LoadingState());


  void getTodo() async{
    if(state is ShowTodoSuccessState == false){
      emit(LoadingState());
    }
    try{
      final todos = await _todoRepo.getTodo();
      emit(ShowTodoSuccessState(todos: todos));
    }
    catch(e){
        emit(ShowTodoFailureState(e));
    }
  }

  Stream observeTodos(){
      final _todoStream = _todoRepo.observeTodos();
      _todoStream.listen((_)=>getTodo());
  }

  void createTodo(String title) async{
    await _todoRepo.createTodo(title);
  }

  void updateTodo(Todo todo,bool isComplete) async{
    await _todoRepo.updateTodo(todo, isComplete);
  }
}