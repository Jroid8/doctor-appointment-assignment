import 'package:doctor_appointment/common/repos/localdb.dart';

abstract class BookingsRepo {
  Future<List<BookingData>> fetch();
  Future<int> add({required int doctor, required DateTime datetime});
  Future<void> cancel(int id);
}

class MockBookingsRepo implements BookingsRepo {
  static List<BookingData> mockedList = [
    BookingData(
      id: 0,
      doctor: 1,
      datetime: DateTime(2026, 5, 14, 16, 0),
      isCanceled: false,
    ),
    BookingData(
      id: 1,
      doctor: 1,
      datetime: DateTime(2026, 5, 18, 16, 30),
      isCanceled: false,
    ),
    BookingData(
      id: 2,
      doctor: 1,
      datetime: DateTime(2026, 5, 28, 15, 0),
      isCanceled: true,
    ),
    BookingData(
      id: 3,
      doctor: 1,
      datetime: DateTime(2026, 5, 29, 16, 0),
      isCanceled: false,
    ),
    BookingData(
      id: 4,
      doctor: 3,
      datetime: DateTime(2026, 7, 4, 9, 30),
      isCanceled: true,
    ),
    BookingData(
      id: 5,
      doctor: 2,
      datetime: DateTime(2026, 7, 5, 9, 0),
      isCanceled: false,
    ),
    BookingData(
      id: 6,
      doctor: 4,
      datetime: DateTime(2026, 7, 13, 10, 0),
      isCanceled: false,
    ),
  ];

  @override
  Future<List<BookingData>> fetch() async {
    return mockedList;
  }

  int lastId = 6;

  @override
  Future<int> add({required int doctor, required DateTime datetime}) async {
    return ++lastId;
  }

  @override
  Future<void> cancel(int id) async {
    mockedList[id] = mockedList[id].copyWith(isCanceled: true);
  }
}
