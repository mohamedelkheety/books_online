import 'package:books_online/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchFutureBooks();
  Future<List<BookEntity>> fetchNewsetBooks();
}
