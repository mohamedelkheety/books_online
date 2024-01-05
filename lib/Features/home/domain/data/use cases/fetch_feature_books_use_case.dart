import 'package:books_online/Features/home/domain/data/use%20cases/use_case.dart';
import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/Features/home/domain/entities/repo/home_repo.dart';
import 'package:books_online/core/errors/error.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Fialure, List<BookEntity>>> call([void param]) async {
    return await homeRepo.fetchFeatureBooks();
  }
}
