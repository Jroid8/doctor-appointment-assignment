import "package:geolocator/geolocator.dart";

abstract class DeviceLocationProvider {
  Future<Position?> getSilent();
  Future<Position> getPrecise();
}

class GeolocatorLibDLP implements DeviceLocationProvider {
  Future<Position> _get(
    LocationSettings settings,
    bool requestPermission,
  ) async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw LocationServiceDisabledException();
    }
    switch (await Geolocator.checkPermission()) {
      case .whileInUse:
      case .always:
        return await Geolocator.getCurrentPosition(locationSettings: settings);
      case .denied:
        if (requestPermission) {
          LocationPermission perm = await Geolocator.requestPermission();
          if (perm == .always || perm == .whileInUse) {
            return Geolocator.getCurrentPosition(locationSettings: settings);
          }
        }
        throw PermissionDeniedException;
      case .deniedForever:
      case .unableToDetermine:
        throw PermissionDeniedException;
    }
  }

  @override
  Future<Position?> getSilent() async {
    try {
      return await _get(LocationSettings(accuracy: .low), false);
    } on PermissionDeniedException {
      return null;
    } on LocationServiceDisabledException {
      return null;
    }
  }

  @override
  Future<Position> getPrecise() {
    return _get(LocationSettings(accuracy: .best), true);
  }
}

class MockDeviceLocationProvider extends DeviceLocationProvider {
  static Position mockLocation = Position(
    longitude: -73.9857,
    latitude: 40.7484,
    timestamp: DateTime.utc(2026, 6, 24, 12, 34, 56),
    accuracy: 8.5,
    altitude: 15.2,
    altitudeAccuracy: 3.1,
    heading: 123.4,
    headingAccuracy: 6.7,
    speed: 2.8,
    speedAccuracy: 1.2,
    floor: null,
    isMocked: true,
  );

  @override
  Future<Position?> getSilent() async {
		Future.delayed(Duration(seconds: 3));
    return Future.value(mockLocation);
  }

  @override
  Future<Position> getPrecise() {
    Future.delayed(Duration(seconds: 10));
    return Future.value(mockLocation);
  }
}
