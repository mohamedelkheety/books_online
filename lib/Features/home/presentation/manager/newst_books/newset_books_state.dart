import 'package:books_online/Features/home/domain/entities/book_entity.dart';

abstract class NewsetBooksState {}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBooksLoading extends NewsetBooksState {}

final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> book;

  NewsetBooksSuccess(this.book);
}

final class NewsetBooksFialure extends NewsetBooksState {
  final String errorMassage;

  NewsetBooksFialure(this.errorMassage);
}
