import 'package:flutter/material.dart';
import 'package:flutter_13_bloc_and_cubit/post_cubit.dart';
import 'package:flutter_13_bloc_and_cubit/post_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_view.dart';
class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,

      ),
      body: BlocBuilder<PostCubit,List<Post>>(

        builder: (context,posts){
          if(posts.isEmpty)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          return ListView.builder(itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(posts[index].title),
              ),
            );
          });
        },

    ),
    );
  }
}
