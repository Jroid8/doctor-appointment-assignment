import 'package:flutter/services.dart';

abstract class ClientPictureRepo {
  Future<Uint8List?> getForId(int id);
}

class MockClientPictureRepo implements ClientPictureRepo {
  @override
  Future<Uint8List?> getForId(int id) async {
    try {
      return Uint8List.sublistView(
        await rootBundle.load("assets/images/test/c-$id.png"),
      );
    } catch (e) {
      return Future.value(null);
    }
  }
}
