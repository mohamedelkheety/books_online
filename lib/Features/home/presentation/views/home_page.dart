import 'package:books_online/Features/home/presentation/manager/featur_fetch_books/featured_books_cubit.dart';
import 'package:books_online/Features/home/presentation/views/widget/custom_text.dart';
import 'package:books_online/Features/home/presentation/views/widget/item_list_view.dart';
import 'package:books_online/Features/home/presentation/views/widget/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            SliverToBoxAdapter(child: ItemListViewInCubit()),
            SliverToBoxAdapter(child: CustomText(text: 'Newest Books')),
            NewestBooksSliverList(),
          ],
        ),
      ),
    );
  }
}

class ItemListViewInCubit extends StatelessWidget {
  const ItemListViewInCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return const ItemListView();
      } else if (state is FeaturedBooksFialure) {
        return Text(state.errorMassage);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
