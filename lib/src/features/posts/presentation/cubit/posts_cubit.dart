import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:post_data_app/src/features/posts/data/models/posts_model.dart';
import 'package:post_data_app/src/features/posts/domain/usecase/posts_usecase.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUseCase getPostsUseCase;
  PostsCubit({required this.getPostsUseCase}) : super(PostsInitial()){
    getUser();
  }

  getUser() async {
    emit(PostsLoading());
    var data = await getPostsUseCase.call();
    data.fold((error) {
      emit(PostsError(errorMsg: error.errorMessage));
    }, (success) {
      emit(PostsLoaded(postList: success));
    });
  }
}
