import 'package:doctor_appointment/features/location/models/client_location.dart';
import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:doctor_appointment/features/location/repos/device_location.dart';
import 'package:doctor_appointment/features/location/repos/label.dart';
import 'package:doctor_appointment/features/location/repos/pos_to_tile.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ClientLocator {
  final DeviceLocationProvider locationProvider;
  final LocationLabelRepo labelRepo;
  final PosToTile posToTile;
  final Rx<ClientLocation?> _lastLocation;
  final Rx<MapTile?> _lastTile;
	
  bool _silentLocated = false;

  ClientLocator({
    ClientLocation? lastLocation,
    required this.locationProvider,
    required this.labelRepo,
    required this.posToTile,
  }) : _lastLocation = lastLocation.obs,
       _lastTile = Rx(
         lastLocation == null ? null : posToTile.convert(lastLocation.position),
       );

  Future<void> initSilent() async {
    if (!_silentLocated) {
      Position? pos = await locationProvider.getSilent();
      if (pos != null) {
        LatLng latlng = LatLng(pos.latitude, pos.longitude);
        _lastLocation.value = ClientLocation(
          latlng,
          await labelRepo.getLabel(latlng),
        );
        _lastTile.value = posToTile.convert(latlng);
      }
			_silentLocated = true;
    }
  }

  Future<ClientLocation> getPrecise() async {
    Position? pos = await locationProvider.getPrecise();
    LatLng latlng = LatLng(pos.latitude, pos.longitude);
    _lastLocation.value = ClientLocation(
      latlng,
      await labelRepo.getLabel(latlng),
    );
    _lastTile.value = posToTile.convert(latlng);
    return _lastLocation.value!;
  }

  Rx<ClientLocation?> get location {
    initSilent();
    return _lastLocation;
  }

  Rx<MapTile?> get tile {
    initSilent();
    return _lastTile;
  }
}
