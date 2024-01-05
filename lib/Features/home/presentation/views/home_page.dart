import 'package:books_online/Features/home/presentation/views/widget/newest_books_item.dart';
import 'package:books_online/Features/home/presentation/views/widget/custom_text.dart';
import 'package:books_online/Features/home/presentation/views/widget/item_list_view.dart';
import 'package:books_online/Features/home/presentation/views/widget/newest_books_list_view.dart';
import 'package:flutter/material.dart';

import 'widget/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomAppBar()),
            SliverToBoxAdapter(child: ItemListView()),
            SliverToBoxAdapter(child: CustomText(text: 'Newest Books')),
            NewestBooksSliverList(),
          ],
        ),
      ),
    );
  }
}
