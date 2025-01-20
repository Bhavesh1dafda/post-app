part of 'posts_cubit.dart';

@immutable
sealed class PostsState extends Equatable {
  const PostsState();
  @override
  List<Object?> get props => [];
}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsError extends PostsState {
  final String errorMsg;

  const PostsError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}

final class PostsLoaded extends PostsState {
  final List<PostModel> postList;

  const PostsLoaded({required this.postList});
  @override
  List<Object?> get props => [postList];
}
