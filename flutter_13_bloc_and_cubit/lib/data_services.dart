import 'dart:convert';

import 'package:flutter_13_bloc_and_cubit/posts.dart';
import 'package:http/http.dart' as http;
import 'posts.dart';

class DataService{
  Future<List<Posts>> getPosts() async{

    try{
      //https://jsonplaceholder.typicode.com/posts
      final uri = Uri.https("jsonplaceholder.typicode.com", "/posts");

      final response = await http.get(uri);

      final json = jsonDecode(response.body) as List;

      final posts = json.map((jsonPost) => Posts.fromJson(jsonPost)).toList();

      return posts;
    }
   catch(e){
      throw e;
   }

  }
}