import 'dart:convert';
import 'dart:typed_data';
import 'package:doctor_appointment/common/models/client_info.dart';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/location/models/client_location.dart';
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

class ActiveSession {
  final Uint8List token;
  final ClientInfo client;
  final ClientLocator locator;
  final DoctorDbManager doctorListMgr;
  final HealthCenterDbManager healthCenterListMgr;
  final BookingsManager bookingsMgr;
  final NotificationsManager notificationsMgr;

  const ActiveSession({
    required this.token,
    required this.client,
    required this.locator,
    required this.healthCenterListMgr,
    required this.doctorListMgr,
    required this.bookingsMgr,
    required this.notificationsMgr,
  });

  ActiveSession.fromLocalTable(ClientSessionTblData data)
    : token = data.sessionToken,
      client = ClientInfo.fromLocalTable(data),
      locator = ClientLocator(
        lastLocation: ClientLocation.fromLocalTable(data),
        locationProvider: MockDeviceLocationProvider(),
        labelRepo: MockLocationLabelRepo(),
        posToTile: MockPosToTile(),
      ),
      healthCenterListMgr = HealthCenterDbManager(
        localdb: LocalDB.instance,
        remoteRepo: MockHealthCenterRepo(),
        favRemoteRepo: MockFavoritesRepo(),
      ),
      doctorListMgr = DoctorDbManager(
        localdb: LocalDB.instance,
        remoteRepo: MockDoctorsRepo(),
        favRemoteRepo: MockFavoritesRepo(),
      ),
      bookingsMgr = BookingsManager(
        localdb: LocalDB.instance,
        remoteRepo: MockBookingsRepo(),
      ),
      notificationsMgr = NotificationsManager(
        localdb: LocalDB.instance,
        remoteRepo: MockNotificationRepo(),
      );

  ClientSessionTblData toLocalTable() => ClientSessionTblData(
    id: client.id,
    name: client.name,
    email: client.email,
    phoneNumber: client.phoneNumber,
    sessionToken: token,
  );

  ActiveSession.fromJson(Map<String, dynamic> json, Uint8List? picture)
    : token = base64Decode(json["sessionToken"]),
      client = ClientInfo.fromJson(json, picture),
      locator = ClientLocator(
        lastLocation: null,
        locationProvider: MockDeviceLocationProvider(),
        labelRepo: MockLocationLabelRepo(),
        posToTile: MockPosToTile(),
      ),
      healthCenterListMgr = HealthCenterDbManager(
        localdb: LocalDB.instance,
        remoteRepo: MockHealthCenterRepo(),
        favRemoteRepo: MockFavoritesRepo(),
      ),
      doctorListMgr = DoctorDbManager(
        localdb: LocalDB.instance,
        remoteRepo: MockDoctorsRepo(),
        favRemoteRepo: MockFavoritesRepo(),
      ),
      bookingsMgr = BookingsManager(
        localdb: LocalDB.instance,
        remoteRepo: MockBookingsRepo(),
      ),
      notificationsMgr = NotificationsManager(
        localdb: LocalDB.instance,
        remoteRepo: MockNotificationRepo(),
      );
}
