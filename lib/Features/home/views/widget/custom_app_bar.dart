import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size mediaQ = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: mediaQ.height * 0.05, bottom: mediaQ.height * 0.02),
      child: const Text(
        'Books Online',
        style: TextStyle(
          fontSize: 26,
          fontFamily: 'Pacifico',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
