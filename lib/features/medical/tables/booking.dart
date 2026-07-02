import 'package:drift/drift.dart';

class Booking extends Table {
  IntColumn get id => integer().unique()();
  IntColumn get doctor => integer()();
  DateTimeColumn get datetime => dateTime()();
	BoolColumn get isCanceled => boolean()();
}
