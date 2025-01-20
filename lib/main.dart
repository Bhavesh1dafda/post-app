import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_data_app/src/core/di.dart';
import 'package:post_data_app/src/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:post_data_app/src/features/posts/presentation/view/posts.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();
  runApp(ScreenUtilInit(
    designSize: const Size(428, 927),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (ctd, child) {
      return BlocProvider(
        create: (context) => getIt<PostsCubit>(),
        child: const MaterialApp(
          title: 'Post App',
          debugShowCheckedModeBanner: false,
          home: Posts(),
        ),
      );
    },
  ),);
}

