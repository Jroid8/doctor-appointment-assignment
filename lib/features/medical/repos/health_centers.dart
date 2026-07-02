import 'dart:typed_data';
import 'package:doctor_appointment/features/location/models/tile.dart';
import 'package:doctor_appointment/features/medical/models/health_center.dart';
import 'package:doctor_appointment/features/medical/repos/health_center_images.dart';
import 'package:latlong2/latlong.dart';

abstract class HealthCentersRepo {
  Future<List<HealthCenter>> fetch(MapTile tile);
}

class MockHealthCenterRepo implements HealthCentersRepo {
  static List<HealthCenter> mockedHcData = [
    HealthCenter(
      id: 1,
      name: "Sunrise Health Clinic",
      address: "123 Oak Street, CA 98765",
      rating: 5.0,
      reviewCount: 128,
      location: LatLng(0, 0),
      type: .hospital,
      isFavorite: false,
			tile: MapTile(0, 0)
    ),
    HealthCenter(
      id: 2,
      name: "Golden Cardiology Center",
      address: "555 Bridge Street, Golden Gate",
      rating: 4.9,
      reviewCount: 58,
      location: LatLng(0, 0),
      type: .clinic,
      isFavorite: true,
			tile: MapTile(0, 0),
    ),
  ];
  static bool picturesInserted = false;

  @override
  Future<List<HealthCenter>> fetch(_) async {
    if (!picturesInserted) {
      for (int i = 0; i < mockedHcData.length; i++) {
        HealthCenter hc = mockedHcData[i];
        Uint8List? imageData = await MockHealthCenterImagesRepo().getForId(
          hc.id,
        );
        if (imageData != null) {
          mockedHcData[i] = hc.copyWith(
            picture: Uint8List.sublistView(imageData),
          );
        }
      }
      picturesInserted = true;
    }
    return mockedHcData;
  }
}
