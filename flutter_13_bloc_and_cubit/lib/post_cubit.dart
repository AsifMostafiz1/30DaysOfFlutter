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
abstract class PostEvent{}

class LoadPostEvent extends PostEvent{}
class PullToRefreshEvent extends PostEvent{}

abstract class PostState{}

class LoadingPostState extends PostState{}

class LoadedPostState extends PostState{
  List<Posts> posts;
  LoadedPostState(this.posts);
}

class FailedToLoadPostState extends PostState{
  Error error;

  FailedToLoadPostState({this.error});
}


class PostBloc extends Bloc<PostEvent,PostState>{
  final _dataService = DataService();

  PostBloc() : super(LoadingPostState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {

    if(event is LoadPostEvent || event is PullToRefreshEvent)
      {
        yield LoadingPostState();

        try{
          final posts =  await _dataService.getPosts();
          yield LoadedPostState(posts);
        }
        catch(e){
              yield FailedToLoadPostState(error: e);
        }
      }
  }

}