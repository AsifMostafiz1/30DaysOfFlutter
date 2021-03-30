import 'package:bloc/bloc.dart';
import 'package:flutter_13_bloc_and_cubit/data_service.dart';
import 'package:flutter_13_bloc_and_cubit/post_view.dart';

class PostCubit extends Cubit<List<Post>>{
  final _dataService = DataService();
  PostCubit(): super([]);


  void getPost() async => emit(await _dataService.getData());
}