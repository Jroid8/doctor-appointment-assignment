import 'dart:typed_data';

class Review {
  final String name;
  final int rating;
  final Uint8List? picture;
  final String review;

  const Review({
    required this.name,
    required this.rating,
    required this.review,
    this.picture,
  });
}
