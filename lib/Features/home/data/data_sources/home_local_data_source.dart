import 'package:books_online/Features/home/domain/entities/book_entity.dart';
import 'package:books_online/core/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity> fetchNewsetBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);

    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewsetBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);

    return box.values.toList();
  }
}
