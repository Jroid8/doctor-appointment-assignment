import 'package:flutter/services.dart';

abstract class DoctorImagesRepo {
  Future<Uint8List?> getForId(int id);
}

class MockDoctorImagesRepo implements DoctorImagesRepo {
  @override
  Future<Uint8List?> getForId(int id) {
    return rootBundle
        .load("assets/images/test/d-$id.png")
        .then((bd) => Uint8List.sublistView(bd));
  }
}
