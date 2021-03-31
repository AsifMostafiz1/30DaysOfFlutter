import 'package:flutter_13_bloc_and_cubit/data_services.dart';
import 'package:flutter_13_bloc_and_cubit/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<List<Posts>>
{
  final _dataService = DataService();
  PostCubit(): super([]);

  void getPosts() async{
    return emit(await _dataService.getPosts());
  }
}