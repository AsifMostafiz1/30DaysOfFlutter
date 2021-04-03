import 'package:flutter/material.dart';
import 'package:flutter_13_bloc_and_cubit/nav_cubit.dart';
import 'package:flutter_13_bloc_and_cubit/post_view.dart';
import 'package:flutter_13_bloc_and_cubit/posts.dart';
import 'package:flutter_13_bloc_and_cubit/posts_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Posts>(builder: (context, posts) {
      return Navigator(
        pages: [
          MaterialPage(child: PostView()),
          if (posts != null)
            MaterialPage(child: PostDetailsPage(posts: posts))
        ],
        onPopPage: (route,result){
          BlocProvider.of<NavCubit>(context).popToPost();
          return route.didPop(result);
        },

      );
    });
  }
}
