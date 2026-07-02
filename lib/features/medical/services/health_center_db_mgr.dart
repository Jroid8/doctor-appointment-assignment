import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:doctor_appointment/features/location/services/client_locator.dart';
import 'package:doctor_appointment/features/medical/models/health_center.dart';
import 'package:doctor_appointment/features/medical/repos/favorites.dart';
import 'package:doctor_appointment/features/medical/repos/health_centers.dart';
import 'package:drift/drift.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HealthCenterDbManager {
  final HealthCentersRepo remoteRepo;
  final FavoritesRepo favRemoteRepo;
  final LocalDB localdb;
  RxList<HealthCenter> healthCenters = RxList();

  HealthCenterDbManager({
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

  void fetch(MapTile tile) {
    (localdb.healthCenterTbl.select()
          ..where((t) => t.tileX.equals(tile.x) & t.tileY.equals(tile.y)))
        .get()
        .then(
          (rows) => healthCenters.value = List.of(
            rows.map(HealthCenter.fromLocalTable),
          ),
        );
    remoteRepo.fetch(tile).then((hcs) {
      healthCenters.value = hcs;
      localdb.healthCenterTbl.insertAll(
        hcs.map((hc) => hc.toLocalTable()),
        mode: .insertOrReplace,
      );
    });
  }

  void setFavorite(HealthCenter hc, bool newValue) async {
    await (localdb.healthCenterTbl.update()..where((t) => t.id.equals(hc.id)))
        .write(hc.copyWith(isFavorite: newValue).toLocalTable());
    await favRemoteRepo.setHealthCenter(hc.id, newValue);
    int idx = healthCenters.indexWhere((m) => m.id == hc.id);
    healthCenters[idx] = hc.copyWith(isFavorite: newValue);
  }
}
