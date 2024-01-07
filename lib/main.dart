import 'package:books_online/Features/Splash/presentation/views/splash_view.dart';
import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  runApp(const MyApp());
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBox);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xff100B20)),
      home: const SplashView(),
    );
  }
}
