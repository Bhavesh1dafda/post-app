import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:post_data_app/src/core/utils/api_logger.dart';
import 'package:post_data_app/src/features/posts/data/datasourse/remote/posts_remote_data_sourse.dart';
import 'package:post_data_app/src/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:post_data_app/src/features/posts/domain/repositories/posts_repositories.dart';
import 'package:post_data_app/src/features/posts/domain/usecase/posts_usecase.dart';
import 'package:post_data_app/src/features/posts/presentation/cubit/posts_cubit.dart';

final getIt = GetIt.instance;

Future<void> injectDependency() async {
  getIt.registerSingleton<Dio>(Dio()..interceptors.add(apiLogger));

  getIt.registerFactory(() => PostsCubit(getPostsUseCase: getIt()));

  getIt.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(postsRemoteDataSource: getIt()));

  getIt.registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDataSource(dio: getIt()));

  getIt.registerLazySingleton(() => GetPostsUseCase(postsRepository: getIt()));
}
