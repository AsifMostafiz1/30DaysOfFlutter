import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_13_bloc_and_cubit/nav_cubit.dart';
import 'package:flutter_13_bloc_and_cubit/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts.dart';
class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          centerTitle: true,
        ),

        body: BlocBuilder<PostBloc,PostState>(
          builder: (context,state){
            if(state is LoadingPostState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is LoadedPostState) {
                return RefreshIndicator(
                  onRefresh: () async => BlocProvider.of<PostBloc>(context)..add(PullToRefreshEvent()),
                  child: ListView.builder(
                    itemCount: state.posts.length,
                      itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text(state.posts[index].title),
                        onTap: ()=> BlocProvider.of<NavCubit>(context)
                            .showPostDetails(state.posts[index]),
                      ),
                    );
                  }),
                );
              }
            else if(state is FailedToLoadPostState){
                return Center(
                  child: Text('Error: ${state.error}'),
                );
            }
            else{
              return Container();
            }


          },
        ),
      ),
    );
  }
}
