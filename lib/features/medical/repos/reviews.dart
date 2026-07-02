import 'package:doctor_appointment/features/medical/models/review.dart';

abstract class ReviewsRepo {
  Future<List<Review>> fetch(int doctor);
}

class MockReviewsRepo implements ReviewsRepo {
  @override
  Future<List<Review>> fetch(int doctor) async {
    return [
      Review(
        name: "Emily Anderson",
        rating: 10,
        review:
            "Dr. Patel is a true professional who genuinely cares about his patients. I highly recommend Dr. Patel to anyone seeking exceptional cardiac care",
      ),
    ];
  }
}
