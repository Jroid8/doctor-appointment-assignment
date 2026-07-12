import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:doctor_appointment/features/location/services/client_locator.dart';
import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/repos/doctors.dart';
import 'package:doctor_appointment/features/medical/repos/favorites.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

class DoctorDbManager {
  final DoctorsRepo remoteRepo;
  final FavoritesRepo favRemoteRepo;
  final LocalDB localdb;
  final RxMap<int, Doctor> doctors = RxMap();

  DoctorDbManager({
    required this.localdb,
    required this.remoteRepo,
    required this.favRemoteRepo,
  });

  void setupAutoFetch(ClientLocator locator) {
    void fetchIf(MapTile? tile) {
      if (tile != null) {
        fetch(tile);
      }
    }

    fetchIf(locator.tile.value);
    locator.tile.listen(fetchIf);
  }

  void load(Iterable<Doctor> list) {
    doctors.value = Map.fromEntries(list.map((doc) => MapEntry(doc.id, doc)));
  }

  void fetch(MapTile tile) {
    (localdb.doctorTbl.select()
          ..where((t) => t.tileX.equals(tile.x) & t.tileY.equals(tile.y)))
        .get()
        .then((rows) => load(rows.map(Doctor.fromLocalTable)));
    remoteRepo.fetch(tile).then((docs) {
      if (docs == null) return;
      load(docs);
      localdb.doctorTbl.insertAll(
        docs.map((doc) => doc.toLocalTable()),
        mode: .insertOrReplace,
      );
    });
  }

  void _updateFoundDoc(Rx<Doctor?> dest, Doctor src) {
    dest.value = src;
    doctors[src.id] = src;
  }

  Rx<Doctor?> find(int id) {
    Rx<Doctor?> result = Rx(null);
    if (doctors.containsKey(id)) {
      result = Rx(doctors[id]);
    } else {
      result = Rx(null);
      (localdb.doctorTbl.select()..where((t) => t.id.equals(id))).get().then((
        docs,
      ) {
        if (docs.isNotEmpty) {
          _updateFoundDoc(result, Doctor.fromLocalTable(docs.first));
        }
      });
      remoteRepo.find(id).then((doc) {
        _updateFoundDoc(result, doc);
        localdb.doctorTbl.insertOne(doc.toLocalTable(), mode: .insertOrReplace);
      });
    }
    return result;
  }

  void setFavorite(Doctor doc, bool newValue) async {
    await (localdb.doctorTbl.update()..where((t) => t.id.equals(doc.id))).write(
      doc.copyWith(isFavorite: newValue).toLocalTable(),
    );
    await favRemoteRepo.setDoctor(doc.id, newValue);
    doctors[doc.id] = doc.copyWith(isFavorite: newValue);
  }
}
