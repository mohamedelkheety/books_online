import 'package:books_online/Features/home/presentation/views/widget/newest_books_item.dart';
import 'package:flutter/material.dart';

class NewestBooksSliverList extends StatelessWidget {
  const NewestBooksSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return const NewestBooksItem();
      }),
    );
  }
}
