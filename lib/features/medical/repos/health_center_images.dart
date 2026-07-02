import 'package:flutter/services.dart';

abstract class HealthCenterImagesRepo {
  Future<Uint8List?> getForId(int id);
}

class MockHealthCenterImagesRepo implements HealthCenterImagesRepo {
  @override
  Future<Uint8List?> getForId(int id) {
    return rootBundle
        .load("assets/images/test/hc-$id.png")
        .then((bd) => Uint8List.sublistView(bd));
  }
}
