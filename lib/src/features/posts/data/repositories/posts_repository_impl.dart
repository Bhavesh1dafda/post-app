import 'package:dartz/dartz.dart';
import 'package:post_data_app/src/core/error/api_error.dart';
import 'package:post_data_app/src/features/posts/data/datasourse/remote/posts_remote_data_sourse.dart';
import 'package:post_data_app/src/features/posts/data/models/posts_model.dart';
import 'package:post_data_app/src/features/posts/domain/repositories/posts_repositories.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource postsRemoteDataSource;

  PostsRepositoryImpl({required this.postsRemoteDataSource});
  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      final posts = await postsRemoteDataSource.getPosts();
      return Right(posts);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
