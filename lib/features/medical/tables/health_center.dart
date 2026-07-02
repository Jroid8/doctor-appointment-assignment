import 'package:drift/drift.dart';


class HealthCenterTbl extends Table {
	IntColumn get id => integer().unique()();
	TextColumn get name => text()();
	TextColumn get address => text()();
	Column<double> get rating => real()();
	IntColumn get reviewCount => integer()();
	Column<double> get latitude => real()();
	Column<double> get longitude => real()();
	Column<bool> get isHospital => boolean()();
	Column<bool> get isFavorite => boolean()();
	IntColumn get tileX => integer()();
	IntColumn get tileY => integer()();
	Column<Uint8List> get picture => blob().nullable()();
}
