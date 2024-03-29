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
    Map<String, dynamic> data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=Flutter');
    List<BookEntity> books = implmentList(data);
    cashDataInHive(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    Map<String, dynamic> data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = implmentList(data);
    cashDataInHive(books, kNewestBox);
    return books;
  }

//helper method
  void cashDataInHive(List<BookEntity> books, String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    box.addAll(books);
  }

  List<BookEntity> implmentList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['itmes']) {
      books.add(BookEntity.fromJson(bookMap));
    }
    return books;
  }
}
