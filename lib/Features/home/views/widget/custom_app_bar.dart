import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Size mediaQ = MediaQuery.of(context).size;
    return const Padding(
      padding: EdgeInsets.only(top: 45, bottom: 10),
      child: Text(
        'Books Online',
        style: TextStyle(
          fontSize: 26,
          fontFamily: 'GT Sectra Fine Regular',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
