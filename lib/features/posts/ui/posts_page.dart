import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Page'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            postBloc.add(PostAddEvent());
          }),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostFetchingSuccessfulState:
              final successState = state as PostFetchingSuccessfulState;
              return ListView.builder(
                itemCount: successState.postData.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(successState.postData[index].title),
                          Text(successState.postData[index].body),
                        ]),
                  );
                },
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
