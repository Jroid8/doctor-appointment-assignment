import 'package:drift/drift.dart';

class ClientSessionTbl extends Table {
  IntColumn get id => integer().unique()();
  TextColumn get name => text()();
  TextColumn get nickname => text().nullable()();
  TextColumn get email => text()();
  IntColumn get gender => integer().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  Column<double> get latitude => real().nullable()();
  Column<double> get longitude => real().nullable()();
  TextColumn get locationLabel => text().nullable()();
  Column<Uint8List> get picture => blob().nullable()();
  Column<Uint8List> get sessionToken => blob()();
}
