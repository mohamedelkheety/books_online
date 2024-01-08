import 'package:books_online/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:books_online/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/Features/home/domain/entities/repo/home_repo.dart';
import 'package:books_online/core/errors/error.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Fialure, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      List<BookEntity> booksListLocal = homeLocalDataSource.fetchFeatureBooks();
      if (booksListLocal.isNotEmpty) {
        return right(booksListLocal);
      }
      List<BookEntity> booksListRemote =
          await homeRemoteDataSource.fetchFeatureBooks();
      return right(booksListRemote);
    } on Exception catch (e) {
      return left(Fialure());
    }
  }

  @override
  Future<Either<Fialure, List<BookEntity>>> fetchNewsetBooks() async {
    try {
      List<BookEntity> booksListLocal = homeLocalDataSource.fetchNewsetBooks();
      if (booksListLocal.isNotEmpty) {
        return right(booksListLocal);
      }
      List<BookEntity> booksListRemote =
          await homeRemoteDataSource.fetchNewsetBooks();
      return right(booksListRemote);
    } on Exception catch (e) {
      return left(Fialure());
    }
  }
}
