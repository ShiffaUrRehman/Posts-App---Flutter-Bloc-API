part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostsInitialFetchEvent extends PostEvent {}

class PostAddEvent extends PostEvent {}
