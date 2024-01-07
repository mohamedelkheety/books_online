import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/core/constants.dart';

import 'package:books_online/core/utils/api_service.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewsetBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatureBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=Flutter');
    List<BookEntity> books = [];
    for (var bookMap in data['itmes']) {
      books.add(BookEntity.fromJson(bookMap));
    }
    var box = Hive.box(kFeaturedBox);
    box.addAll(books);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = [];
    for (var bookMap in data['itmes']) {
      books.add(BookEntity.fromJson(bookMap));
    }
    return books;
  }
}
