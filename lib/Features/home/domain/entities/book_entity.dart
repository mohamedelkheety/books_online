class BookEntity {
  final String title, auther, image;
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
      auther: json["items"]["volumeInfo"]["authors"][0],
      image: json["items"]["volumeInfo"]["imageLinks"]["thumbnail"],
      rating: json["items"]["volumeInfo"]["ratingsCount"],
    );
  }
}
