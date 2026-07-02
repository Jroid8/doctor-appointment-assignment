import 'package:doctor_appointment/common/models/time.dart';
import 'package:doctor_appointment/common/models/weekday.dart';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:get/utils.dart';

class WorkingTime {
  final TimeWindows officeHours;
  final Weekday startDay; // inclusive
  final Weekday endDay; // inclusive

  const WorkingTime({
    required this.officeHours,
    required this.startDay,
    required this.endDay,
  });

  WorkingTime.fromJson(Map<String, dynamic> json)
    : officeHours = TimeWindows.fromJson(json["officeHours"]),
      startDay = Weekday.values[json["startDay"]],
      endDay = Weekday.values[json["endDay"]];

  WorkingTime.fromLocalTable(DoctorTblData data)
    : officeHours = TimeWindows(
        Time.fromMinutes(data.dayStartMin),
        Time.fromMinutes(data.dayEndMin),
        data.visitDuration,
      ),
      startDay = Weekday.values[data.startDay],
      endDay = Weekday.values[data.endDay];

  @override
  String toString() =>
      "${startDay.name.capitalizeFirst}-${endDay.name.capitalizeFirst}, $startDay - $endDay";
}

class TimeWindows extends Iterable<Time> {
  final Time start; // inclusive
  final Time end; // exclusive
  final int visitMinutes;

  const TimeWindows(this.start, this.end, this.visitMinutes);

  TimeWindows.fromJson(Map<String, dynamic> json)
    : start = Time.fromJson(json["start"]),
      end = Time.fromJson(json["end"]),
      visitMinutes = json["duration"];

  @override
  Iterator<Time> get iterator => _TimeWindowIterator(start, end, visitMinutes);
}

class _TimeWindowIterator implements Iterator<Time> {
  Time start;
  Time end;
  int visitMinutes;
  bool startReturned = false;

  _TimeWindowIterator(this.start, this.end, this.visitMinutes);

  @override
  Time get current => start;

  @override
  bool moveNext() {
    if (start.compareTo(end) >= 0) return false;
    if (!startReturned) {
      startReturned = true;
      return true;
    }
    start = start.addMinutes(visitMinutes);
    return true;
  }
}
