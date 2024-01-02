import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.slideingAnimation,
  });

  final Animation<Offset> slideingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slideingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slideingAnimation,
            child: const Text(
              'Read Free Books',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Pacifico',
              ),
            ),
          );
        });
  }
}
