import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/Features/home/domain/entities/repo/home_repo.dart';
import 'package:books_online/core/errors/error.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);
  Future<Either<Fialure, List<BookEntity>>> fetchFeatureBooks() {
    return homeRepo.fetchFeatureBooks();
  }
}
