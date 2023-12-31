import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData()
          .copyWith(scaffoldBackgroundColor: const Color(0xff100B20)),
      home: const Scaffold(),
    );
  }
}
