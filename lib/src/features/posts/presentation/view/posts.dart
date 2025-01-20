import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_data_app/src/core/constant/app_colors.dart';
import 'package:post_data_app/src/core/constant/app_strings.dart';
import 'package:post_data_app/src/core/utils/app_common.dart';
import 'package:post_data_app/src/features/posts/presentation/cubit/posts_cubit.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey.withOpacity(0.40),
        title: Text(
          AppString.allPosts,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        color: AppColors.grey.withOpacity(0.40),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<PostsCubit, PostsState>(
            builder: (context, state) {
              if (state is PostsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PostsError) {
                return Center(child: Text(state.errorMsg));
              }
              if (state is PostsLoaded) {
                return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    var post = state.postList[index];
                    return Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15.r,
                                    child: CachedNetworkImage(
                                      imageUrl: post.url,
                                      placeholder: (context, url) =>
                                          const Icon(Icons.image),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    post.author,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "  in ${post.communityTitle ?? ""} • ",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    AppCommon.timeAgoFromString(
                                        post.updated ?? ""),
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              5.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                          height: 110.h,
                                          child: post.jsonMetadata.image!
                                                  .isNotEmpty
                                              ? Image.network(
                                                  post.jsonMetadata.image
                                                          ?.first ??
                                                      "",
                                                  fit: BoxFit.cover,
                                                )
                                              : Icon(
                                                  Icons.image,
                                                  size: 50.sp,
                                                ))),
                                  5.horizontalSpace,
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          post.title,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              post.jsonMetadata.description !=
                                                  null,
                                          replacement: SizedBox(height: 50.h),
                                          child: SizedBox(
                                            height: 50.h,
                                            child: Text(
                                              post.jsonMetadata.description ??
                                                  "",
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color: AppColors.grey,
                                          height: 2.h,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons
                                                .keyboard_arrow_up_rounded),
                                            Text(post.activeVotes.length
                                                .toString()),
                                            10.horizontalSpace,
                                            Container(
                                              width: 2,
                                              color: AppColors.grey,
                                              height: 15.sp,
                                            ),
                                            10.horizontalSpace,
                                            Icon(
                                              Icons.chat,
                                              size: 18.sp,
                                            ),
                                            5.horizontalSpace,
                                            Text(post.children.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
