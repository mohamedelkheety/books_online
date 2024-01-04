import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/core/errors/error.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Fialure, List<BookEntity>>> fetchFeatureBooks();
  Future<Either<Fialure, List<BookEntity>>> fetchNewsetBooks();
}
