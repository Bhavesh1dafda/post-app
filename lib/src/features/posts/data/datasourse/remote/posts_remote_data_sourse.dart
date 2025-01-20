import 'package:dio/dio.dart';
import 'package:post_data_app/src/core/constant/api_constant.dart';
import 'package:post_data_app/src/features/posts/data/models/posts_model.dart';

class PostsRemoteDataSource {
  final Dio dio;
  PostsRemoteDataSource({
    required this.dio,
  });

  Future<List<PostModel>> getPosts() async {
    try {
      final requestData = {
        "id": 1,
        "jsonrpc": "2.0",
        "method": "bridge.get_ranked_posts",
        "params": {
          "sort": "trending",
          "tag": "",
          "observer": "hive.blog",
        },
      };

      final headers = {
        'accept': 'application/json, text/plain, */*',
        'content-type': 'application/json',
      };

      final response = await dio.post(
        ApiConstant.baseUrl,
        data: requestData,
        options: Options(
          headers: headers,
        ),
      );
      List<dynamic> postList = response.data["result"];
      return postList.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
