import 'package:latlong2/latlong.dart';

abstract class MapDistanceCalculator {
	(double, Duration) getDistance(LatLng destination);
}

class MockMapDistanceCalculator implements MapDistanceCalculator {
	MockMapDistanceCalculator();

	@override
	(double, Duration) getDistance(LatLng destination) {
		return (2.5, Duration(minutes: 40));
	}
}
