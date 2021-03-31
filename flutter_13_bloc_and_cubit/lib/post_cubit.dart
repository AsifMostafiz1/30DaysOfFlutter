import 'package:flutter_13_bloc_and_cubit/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts.dart';

class PostCubit extends Cubit<List<Posts>>{
  final _dataService = DataService();
  PostCubit(): super([]);


  void getPost() async{
    return emit(await _dataService.getPosts());
  }
}