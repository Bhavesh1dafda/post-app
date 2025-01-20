import 'package:dartz/dartz.dart';
import 'package:post_data_app/src/core/error/api_error.dart';
import 'package:post_data_app/src/features/posts/data/models/posts_model.dart';


abstract class PostsRepository {
  Future<Either<Failure, List<PostModel>>> getPosts();
}
