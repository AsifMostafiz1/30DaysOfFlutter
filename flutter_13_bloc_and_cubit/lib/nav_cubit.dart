import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts.dart';

class NavCubit extends Cubit<Posts>{
  NavCubit(): super(null);


  void showPostDetails(Posts posts) => emit(posts);

  void popToPost() => emit(null);

}