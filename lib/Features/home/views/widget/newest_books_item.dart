import 'package:books_online/Features/home/views/widget/newest_books_image.dart';
import 'package:flutter/material.dart';

import 'data_item_newest.dart';

class NewestBooksItem extends StatelessWidget {
  const NewestBooksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          NewestBooksImage(),
          SizedBox(width: 8),
          DataItemNewest(),
        ],
      ),
    );
  }
}
