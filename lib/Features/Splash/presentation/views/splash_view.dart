import 'package:books_online/Features/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';

import 'widget/animated_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideingAnimation;
  @override
  void initState() {
    super.initState();
    //
    animationMethod();
    navigateToHomePage();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
          AnimatedText(slideingAnimation: slideingAnimation)
        ],
      ),
    );
  }

  void animationMethod() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    slideingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  Future<void> navigateToHomePage() {
    return Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return const HomePage();
      }), (route) => false);
    });
  }
}
