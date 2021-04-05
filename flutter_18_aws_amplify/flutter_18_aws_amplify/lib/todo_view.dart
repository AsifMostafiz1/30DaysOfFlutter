import 'package:flutter/material.dart';
import 'package:flutter_18_aws_amplify/models/loading_view.dart';
import 'package:flutter_18_aws_amplify/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/Todo.dart';


class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      floatingActionButton: _floatingActionButton(),
      body: BlocBuilder<TodoCubit,TodoState>(builder: (context,state){
        if(state is ListTodoSuccess)
          {
            return state.todos.isEmpty? _emptyTodoView() : _todosListView(state.todos);
          }
        else if( state is ListTodoFailure)
          {
            return _exceptionView(state.e);
          }
        else
          {
            return LoadingView();
          }

      },),
    );
  }

  Widget _todosListView(List<Todo> todos)
  {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,index){
          final todo = todos[index];

          return Card(
            child: CheckboxListTile(
              title: Text(todo.title),
              value: todo.isCompleted,
              onChanged: (newValue){
                BlocProvider.of<TodoCubit>(context).updateTodo(todo,newValue);
              },
            ),
          );
        });
  }

  Widget _exceptionView(Exception exception)
  {
    return Center(child: Text(exception.toString()),);
  }

  AppBar _appbar() {
    return AppBar(
      title: Text("Todos"),
    );
  }
  Widget _newTodoView(){
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: InputDecoration(hintText: "Enter todo title"),
        ),
        ElevatedButton(onPressed: (){
          BlocProvider.of<TodoCubit>(context)
              .createTodo(_titleController.text);
          _titleController.text= "";
          Navigator.of(context).pop();
          },
            child: Text("Save")),
      ],
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
    onPressed: (){
        showModalBottomSheet(
            context: context,
            builder: (context)=>_newTodoView());
    },);
  }

  Widget _emptyTodoView() {
    return Center(
      child: Text("No TODO yet"),
    );
  }
}
