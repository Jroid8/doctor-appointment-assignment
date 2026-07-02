class Time implements Comparable<Time> {
  final int minute;
  final int hour;

  const Time({required this.minute, required this.hour})
    : assert(minute >= 0),
      assert(minute < 60),
      assert(hour >= 0),
      assert(hour < 24);

  Time.fromJson(Map<String, dynamic> json)
    : minute = json["m"],
      hour = json["h"] {
    if (hour < 0 || hour > 23) {
      throw FormatException('Invalid hour: $hour');
    }
    if (minute < 0 || minute > 59) {
      throw FormatException('Invalid minute: $minute');
    }
  }

  @override
  String toString() {
    int h12 = hour == 0
        ? 12
        : hour > 12
        ? hour - 12
        : hour;
    String p = hour >= 12 ? "PM" : "AM";
    return "${h12.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $p";
  }

  DateTime toDateTime({
    required int year,
    required int month,
    required int day,
    int second = 0,
  }) => DateTime(year, month, day, hour, minute, second);

  DateTime withDate(DateTime date) =>
      DateTime(date.year, date.month, date.day, hour, minute, date.second);

  Time addMinutes(int minutes) {
    final newMin = minute + minutes;
    return Time(minute: newMin % 60, hour: (hour + newMin ~/ 60) % 24);
  }

  @override
  int compareTo(Time other) {
    int hourOrder = hour.compareTo(other.hour);
    return hourOrder == 0 ? minute.compareTo(other.minute) : hourOrder;
  }

  int get totalMinutes => hour * 60 + minute;

  Time.fromMinutes(int minutes) : minute = minutes % 60, hour = minutes ~/ 60;
}
