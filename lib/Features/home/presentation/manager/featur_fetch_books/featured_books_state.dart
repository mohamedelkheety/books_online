part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> book;

  FeaturedBooksSuccess(this.book);
}

final class FeaturedBooksFialure extends FeaturedBooksState {
  final String errorMassage;

  FeaturedBooksFialure(this.errorMassage);
}
