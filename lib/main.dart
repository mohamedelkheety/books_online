import 'package:books_online/Features/Splash/presentation/views/splash_view.dart';
import 'package:books_online/Features/home/domain/data/use%20cases/fetch_feature_books_use_case.dart';
import 'package:books_online/Features/home/domain/data/use%20cases/fetch_newset_books_use_case.dart';
import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/Features/home/domain/entities/repo/home_repo_impl.dart';
import 'package:books_online/Features/home/presentation/manager/featur_fetch_books/featured_books_cubit.dart';
import 'package:books_online/Features/home/presentation/manager/newst_books/newset_books_cubit.dart';
import 'package:books_online/core/constants.dart';
import 'package:books_online/core/utils/git_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
            create: (BuildContext context) => FeaturedBooksCubit(
                FetchFeatureBooksUseCase(getIt.get<HomeRepoImpl>())),
            child: BlocProvider<NewsetBooksCubit>(
              create: (BuildContext context) => NewsetBooksCubit(
                  FetchNewsetBooksUseCase(getIt.get<HomeRepoImpl>())),
            ))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xff100B20)),
        home: const SplashView(),
      ),
    );
  }
}
