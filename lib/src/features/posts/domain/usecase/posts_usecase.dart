import 'package:dartz/dartz.dart';
import 'package:post_data_app/src/core/error/api_error.dart';
import 'package:post_data_app/src/features/posts/data/models/posts_model.dart';
import 'package:post_data_app/src/features/posts/domain/repositories/posts_repositories.dart';




class GetPostsUseCase {
  final PostsRepository postsRepository;

  GetPostsUseCase({required this.postsRepository});

  Future<Either<Failure, List<PostModel>>> call() async {
    return await postsRepository.getPosts();
  }
}
