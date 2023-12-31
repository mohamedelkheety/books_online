import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: MediaQuery.of(context).size.height * 0.30,
          ),
          const Text(
            'Read Free Books',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'Pacifico',
            ),
          )
        ],
      ),
    );
  }
}
