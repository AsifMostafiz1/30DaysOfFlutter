import 'dart:convert';
import 'package:flutter_13_bloc_and_cubit/post_view.dart';
import 'package:http/http.dart' as http;


class DataService {
  final _baseUrl = "jsonplaceholder.typicode.com";

  Future<List<Post>> getData() async {
    try {
      final uri = Uri.https(_baseUrl, "/posts");
      final response = await http.get(uri);

      final json = jsonDecode(response.body) as List;

      final posts = json.map((postJson) => Post.fromJson(postJson)).toList();

      return posts;
    } catch (e) {
      throw e;
    }
  }
}
