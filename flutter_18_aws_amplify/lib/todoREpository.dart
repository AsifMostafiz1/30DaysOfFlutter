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

  Future<void> createTodo(String title) async{

    final newTodo = Todo(title: title,isComplete:  false);

    try{
      await Amplify.DataStore.save(newTodo);
    }catch(e){
      throw e;
    }
  }

  Future<void> updateTodo(Todo todo,bool isComplete) async{

    final updateTodo = todo.copyWith(isComplete: isComplete);

    try{
      await Amplify.DataStore.save(updateTodo);
    }catch(e){
      throw e;
    }
  }
  Stream observeTodos(){
      return Amplify.DataStore.observe(Todo.classType);
  }
}