import 'package:books_online/Features/home/presentation/views/widget/newest_books_image.dart';
import 'package:flutter/material.dart';

import 'data_item_newest.dart';

class NewestBooksItem extends StatelessWidget {
  const NewestBooksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            NewestBooksImage(),
            DataItemNewest(),
          ],
        ),
      ),
    );
  }
}
