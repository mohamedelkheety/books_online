import 'package:flutter/material.dart';

class NewestBooksImage extends StatelessWidget {
  const NewestBooksImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Image.asset(
          'assets/images/My CV.png',
        ),
      ),
    );
  }
}
