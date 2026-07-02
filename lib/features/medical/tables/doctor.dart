import 'package:drift/drift.dart';

class DoctorTbl extends Table {
  IntColumn get id => integer().unique()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  Column<double> get rating => real()();
  IntColumn get reviewCount => integer()();
  Column<double> get latitude => real()();
  Column<double> get longitude => real()();
  Column<bool> get isFavorite => boolean()();
  IntColumn get tileX => integer()();
  IntColumn get tileY => integer()();
  IntColumn get specialty => integer()();
  Column<Uint8List> get picture => blob().nullable()();
  IntColumn get patientsCount => integer()();
  IntColumn get yearsOfExperience => integer()();
  TextColumn get bio => text()();
	IntColumn get dayStartMin => integer()();
	IntColumn get dayEndMin => integer()();
	IntColumn get visitDuration => integer()();
	IntColumn get startDay => integer()();
	IntColumn get endDay => integer()();
}
