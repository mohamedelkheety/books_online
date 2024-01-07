import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? auther;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final num rating;

  BookEntity({
    required this.title,
    required this.auther,
    required this.image,
    required this.rating,
  });

  factory BookEntity.fromJson(json) {
    return BookEntity(
      title: json["items"]["volumeInfo"]["title"],
      auther: json["items"]["volumeInfo"]["authors"][0] ?? "",
      image: json["items"]["volumeInfo"]["imageLinks"]["thumbnail"] ?? '',
      rating: json["items"]["volumeInfo"]["ratingsCount"],
    );
  }
}
