import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:latlong2/latlong.dart';

abstract class PosToTile {
	MapTile convert(LatLng pos);
}

class MockPosToTile implements PosToTile {
	@override
	  MapTile convert(LatLng pos) {
	    return MapTile(0, 0);
	  }
}
