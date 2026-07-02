import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/medical/repos/bookings.dart';
import 'package:drift/drift.dart';
import 'package:get/state_manager.dart' hide Value;

class BookingsManager {
  final LocalDB localdb;
  final BookingsRepo remoteRepo;
  RxList<BookingData> bookings = RxList([]);

  BookingsManager({required this.localdb, required this.remoteRepo});

  void fetch() {
    (localdb.booking.select().get().then((rows) => bookings.value = rows));
    remoteRepo.fetch().then((bk) {
      bookings.value = bk;
      localdb.booking.insertAll(bk, mode: .insertOrReplace);
    });
  }

  Future<void> add({required int doctor, required DateTime datetime}) async {
    int id = await remoteRepo.add(doctor: doctor, datetime: datetime);
    BookingData model = BookingData(
      id: id,
      doctor: doctor,
      datetime: datetime,
      isCanceled: false,
    );
    await localdb.booking.insertOne(model);
    bookings.add(model);
  }

  Future<void> cancel(int id) async {
    await remoteRepo.cancel(id);
    await (localdb.booking.update()..where((tbl) => tbl.id.equals(id))).write(
      BookingCompanion(isCanceled: Value(true)),
    );
    final idx = bookings.indexWhere((b) => b.id == id);
    bookings[idx] = bookings[idx].copyWith(isCanceled: true);
  }
}
