import 'package:amplify_flutter/amplify.dart';
import 'models/Todo.dart';

class TodoRepository{

  Future <List<Todo>> getTodo() async{
    try{
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    }catch(e){
      throw e;
    }
  }
  Future<void> createTodo(String title) async {
    final newTodo = Todo(title: title, isCompleted: false);
    try{
        await Amplify.DataStore.save(newTodo);
    }catch(e){
      throw e;
    }
  }
  Future<void> updateTodo(Todo todo , bool isCompleted) async {
    final updatedTodo = todo.copyWith(isCompleted: isCompleted);
    try{
        await Amplify.DataStore.save(updatedTodo);
    }catch(e){
      throw e;
    }
  }
}