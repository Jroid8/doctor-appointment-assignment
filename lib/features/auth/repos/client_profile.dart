import 'package:doctor_appointment/common/models/client_info.dart';

abstract class ClientProfileRepo {
  Future<void> submit({
    String? name,
    String? nickname,
    bool submitNickname = false,
    Gender? gender,
    String? email,
    String? phoneNumber,
    bool submitPhoneNumber = false,
  });
}

class MockClientProfileRepo implements ClientProfileRepo {
  @override
  Future<void> submit({
    String? name,
    String? nickname,
    bool submitNickname = false,
    Gender? gender,
    String? email,
    String? phoneNumber,
    bool submitPhoneNumber = false,
  }) async {}
}
