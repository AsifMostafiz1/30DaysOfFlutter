import 'package:flutter/material.dart';
import 'package:flutter_18_aws_amplify/LoadingView.dart';
import 'package:flutter_18_aws_amplify/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/Todo.dart';




class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {

  final _titleCOntroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(),
      body: BlocBuilder<TodoCubit,TodoState>(builder: (context,state){
        if(state is ShowTodoSuccessState){
          return state.todos.isEmpty? _emptyTodoView() : _showTodoList(state.todos);
        }
        else if(state is ShowTodoFailureState)
          {
            return _showException(state.exception);
          }
        else{
          return LoadingView();
        }
      },),
    );
  }
  
  Widget _showTodoList(List<Todo> todos){
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,index){
          return Card(
            child: CheckboxListTile(
              title: Text(todos[index].title),
              value: todos[index].isComplete,
              onChanged: (newValue){
                  BlocProvider.of<TodoCubit>(context).updateTodo(todos[index], newValue);
              },
            ),
          );
        });
  }

  Widget _showException(Exception exception){
    return
       Center(child: Text(exception.toString()));

  }
  Widget _floatingActionButton(){
    return FloatingActionButton(
      child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
              context: context, builder: (c){
                return Column(children: [
                  TextField(
                    controller: _titleCOntroller,
                    decoration: InputDecoration(
                      hintText: "Write Todo here",
                    ),
                  ),

                  ElevatedButton(
                      onPressed: (){
                        BlocProvider.of<TodoCubit>(context).createTodo(_titleCOntroller.text);
                        _titleCOntroller.text = "";
                        Navigator.of(context).pop();
                      },
                      child: Text("Save Todo"))
                ],);
          });
        });
  }

  Widget _emptyTodoView(){
    return Container(
      child: Center(
        child: Text("No todo yet"),
      ),
    );
  }
  Widget _appBar(){
    return AppBar(
      title: Text("Todos"),
      centerTitle: true,
    );
  }
}
