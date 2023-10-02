part of 'post_bloc.dart';

@immutable
abstract class PostState {}

abstract class PostActionState extends PostState {}

final class PostInitial extends PostState {}

class PostFetchingLoadingState extends PostState {}

class PostFetchingErrorState extends PostState {}

class PostFetchingSuccessfulState extends PostState {
  final List<PostData> postData;

  PostFetchingSuccessfulState({required this.postData});
}
