import 'package:doctor_appointment/features/notification/table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:doctor_appointment/features/auth/tables/client_session.dart';
import 'package:doctor_appointment/features/medical/tables/health_center.dart';
import 'package:doctor_appointment/features/medical/tables/doctor.dart';
import 'package:doctor_appointment/features/medical/tables/booking.dart';

part 'localdb.g.dart';

@DriftDatabase(
  tables: [
    ClientSessionTbl,
    HealthCenterTbl,
    DoctorTbl,
    Booking,
    UnreadNotificationsTbl,
  ],
)
class LocalDB extends _$LocalDB {
  LocalDB([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static LocalDB? _instance;

  static LocalDB get instance {
    _instance ??= LocalDB();
    return _instance!;
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'localdb',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
