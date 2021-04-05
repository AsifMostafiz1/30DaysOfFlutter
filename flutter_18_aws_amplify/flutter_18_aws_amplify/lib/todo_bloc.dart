import 'package:flutter_18_aws_amplify/models/ModelProvider.dart';
import 'package:flutter_18_aws_amplify/todo_repository.dart';
import 'package:flutter_18_aws_amplify/todo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
abstract class TodoState{}

class LoadingTodos extends TodoState{
}

class ListTodoSuccess extends TodoState{
  final List<Todo> todos;

  ListTodoSuccess({this.todos});
}

class ListTodoFailure extends TodoState{
  final Exception e;

  ListTodoFailure({this.e});
}


class TodoCubit extends Cubit<TodoState>
{
  final _todoRepo = TodoRepository();
  TodoCubit(): super(LoadingTodos());

  void getTodo() async {
    if(state is ListTodoSuccess == false)
      {
        emit(LoadingTodos());
      }
    try{
      final todos = await _todoRepo.getTodo();
      emit(ListTodoSuccess(todos: todos));

    }catch(e){
      emit(ListTodoFailure(e: e));
    }
  }
  void createTodo(String title) async{
    await _todoRepo.createTodo(title);
    getTodo();
  }
  void updateTodo(Todo todo , bool isCompleted) async{
    await _todoRepo.updateTodo(todo, isCompleted);
    getTodo();
  }
}