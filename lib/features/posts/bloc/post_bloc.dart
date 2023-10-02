import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_3/features/posts/models/post_data_ui_model.dart';
import 'package:flutter_application_3/features/posts/repos/posts_repo.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostData> postData = await PostRepo.fetchPosts();
    if (postData == []) {
      emit(PostFetchingErrorState());
    } else {
      emit(PostFetchingSuccessfulState(postData: postData));
    }
  }
}
