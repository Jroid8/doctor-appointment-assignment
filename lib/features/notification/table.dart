import 'package:drift/drift.dart';

class UnreadNotificationsTbl extends Table {
  IntColumn get id => integer().unique()();
  TextColumn get title => text()();
  TextColumn get desc => text()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get icon => integer().nullable()();
}
