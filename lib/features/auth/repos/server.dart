import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:doctor_appointment/common/exceptions/invalid_server_response.dart';
import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/models/client_info.dart';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/common/singletons/server_conn.dart';
import 'package:doctor_appointment/features/auth/exceptions/signup_error.dart';
import 'package:doctor_appointment/features/auth/repos/client_picture.dart';
import 'package:doctor_appointment/features/location/repos/device_location.dart';
import 'package:doctor_appointment/features/location/repos/label.dart';
import 'package:doctor_appointment/features/location/repos/pos_to_tile.dart';
import 'package:doctor_appointment/features/location/services/client_locator.dart';
import 'package:doctor_appointment/features/medical/repos/bookings.dart';
import 'package:doctor_appointment/features/medical/repos/doctors.dart';
import 'package:doctor_appointment/features/medical/repos/favorites.dart';
import 'package:doctor_appointment/features/medical/repos/health_centers.dart';
import 'package:doctor_appointment/features/medical/services/bookings_mgr.dart';
import 'package:doctor_appointment/features/medical/services/doctor_db_mgr.dart';
import 'package:doctor_appointment/features/medical/services/health_center_db_mgr.dart';
import 'package:doctor_appointment/features/notification/manager.dart';
import 'package:doctor_appointment/features/notification/repos/mock.dart';

abstract class AuthServerRepo {
  Future<ActiveSession?> login(String email, String password);
  Future<ActiveSession> signup({
    required String name,
    required String email,
    required String password,
  });
  Future<bool> isValid(Uint8List sessionToken);
  Future<void> requestResetPassword(String email);
  Future<Uint8List?> verifyPasswordResetCode(String email, int code);
  Future<void> completePasswordReset(Uint8List resetToken, String password);
  Future<void> logout(Uint8List sessionToken);
}

class MockAuthServerRepo implements AuthServerRepo {
  final String clientPwd;
  final ClientInfo client;

  const MockAuthServerRepo(this.client, this.clientPwd);

  static ActiveSession mockSession(ClientInfo client) {
    return ActiveSession(
      token: Uint8List(0),
      client: client,
      locator: ClientLocator(
        lastLocation: null,
        locationProvider: MockDeviceLocationProvider(),
        labelRepo: MockLocationLabelRepo(),
        posToTile: MockPosToTile(),
      ),
      healthCenterListMgr: HealthCenterDbManager(
        localdb: LocalDB.instance,
        remoteRepo: MockHealthCenterRepo(),
        favRemoteRepo: MockFavoritesRepo(),
      ),
      doctorListMgr: DoctorDbManager(
        localdb: LocalDB.instance,
        remoteRepo: MockDoctorsRepo(),
        favRemoteRepo: MockFavoritesRepo(),
      ),
      bookingsMgr: BookingsManager(
        localdb: LocalDB.instance,
        remoteRepo: MockBookingsRepo(),
      ),
      notificationsMgr: NotificationsManager(
        localdb: LocalDB.instance,
        remoteRepo: MockNotificationRepo(),
      ),
    );
  }

  @override
  Future<ActiveSession?> login(String email, String password) async {
    if (client.email == email && clientPwd == password) {
      return mockSession(client);
    } else {
      return null;
    }
  }

  @override
  Future<ActiveSession> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    return mockSession(ClientInfo(id: 1, name: name, email: email));
  }

  @override
  Future<bool> isValid(Uint8List sessionToken) async {
    return true;
  }

  @override
  Future<void> requestResetPassword(String email) async {}

  @override
  Future<Uint8List?> verifyPasswordResetCode(String email, int code) async {
    if (code == 1234) {
      return Uint8List(0);
    } else {
      return null;
    }
  }

  @override
  Future<void> completePasswordReset(
    Uint8List resetToken,
    String password,
  ) async {}

  @override
  Future<void> logout(Uint8List sessionToken) async {}
}

class RemoteAuthServerRepo implements AuthServerRepo {
  final ServerConn _conn;
  final ClientPictureRepo _cpr;

  RemoteAuthServerRepo(this._conn, this._cpr);

  @override
  Future<ActiveSession?> login(String email, String password) async {
    Response res = await _conn.dio.post(
      "/auth/login",
      data: {"email": email, "password": password},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (_) => true,
        responseType: .json,
      ),
    );
    switch (res.statusCode) {
      case 201:
        if (res.data is Map<String, dynamic>) {
          return ActiveSession.fromJson(
            res.data,
            await _cpr.getForId(res.data["id"]),
          );
        } else {
          throw InvalidServerResponse("Response content not a JSON object");
        }
      case 401:
        return null;
      default:
        throw InvalidServerResponse.fromStatusCode(res.statusCode);
    }
  }

  @override
  Future<ActiveSession> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    Response res = await _conn.dio.post(
      "/auth/signup",
      data: {"name": name, "email": email, "password": password},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (_) => true,
        responseType: .json,
      ),
    );
    switch (res.statusCode) {
      case 201:
        if (res.data is Map<String, dynamic>) {
          return ActiveSession.fromJson(res.data, null);
        } else {
          throw InvalidServerResponse("Response content not a JSON object");
        }
      case 409:
        throw SignUpError.emailAlreadyExists;
      default:
        throw InvalidServerResponse.fromStatusCode(res.statusCode);
    }
  }

  @override
  Future<bool> isValid(Uint8List sessionToken) async {
    Response res = await _conn.dio.head(
      "/auth/is-valid",
      options: Options(
        validateStatus: (_) => true,
        headers: {"Authorization": "Bearer ${base64Encode(sessionToken)}"},
      ),
    );
    return res.statusCode == 200;
  }

  @override
  Future<void> requestResetPassword(String email) async {
    Response res = await _conn.dio.put(
      "/auth/reset-password/request",
      data: email,
      options: Options(
        contentType: Headers.textPlainContentType,
        validateStatus: (_) => true,
      ),
    );
    if (res.statusCode != 202) {
      throw InvalidServerResponse.fromStatusCode(res.statusCode);
    }
  }

  @override
  Future<Uint8List> verifyPasswordResetCode(String email, int code) async {
    Response res = await _conn.dio.put(
      "/auth/reset-password/verify",
      data: {"email": email, "code": code},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (_) => true,
        responseType: .bytes,
      ),
    );
    if (res.statusCode == 201) {
      if (res.data is List<int>) {
        return res.data;
      } else {
        throw InvalidServerResponse("Response content not List<int>");
      }
    } else {
      throw InvalidServerResponse.fromStatusCode(res.statusCode);
    }
  }

  @override
  Future<void> completePasswordReset(
    Uint8List resetToken,
    String password,
  ) async {
    Response res = await _conn.dio.post(
      "/auth/reset-password/complete",
      data: {"token": resetToken, "password": password},
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (_) => true,
      ),
    );
    if (res.statusCode != 204) {
      throw InvalidServerResponse.fromStatusCode(res.statusCode);
    }
  }

  @override
  Future<void> logout(Uint8List sessionToken) async {
    Response res = await _conn.dio.post(
      "/auth/logout",
      options: Options(
        validateStatus: (_) => true,
        headers: {"Authorization": "Digest ${base64Encode(sessionToken)}"},
      ),
    );
    if (res.statusCode != 200) {
      throw InvalidServerResponse.fromStatusCode(res.statusCode);
    }
  }
}
