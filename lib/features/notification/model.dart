import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:flutter_svg/svg.dart';

enum NotifIcon {
  calendarEdit,
  calendarTick,
  calendarRemove;

  SvgPicture icon() {
    switch (this) {
      case calendarEdit:
        return SvgPicture.asset("assets/images/calendar-edit.svg");
      case calendarTick:
        return SvgPicture.asset("assets/images/calendar-tick.svg");
      case calendarRemove:
        return SvgPicture.asset("assets/images/calendar-remove.svg");
    }
  }
}

class Notification {
  final int id;
  final String title;
  final String desc;
  final DateTime timestamp;
  final NotifIcon? icon;

  const Notification({
    required this.id,
    required this.title,
    required this.desc,
    required this.timestamp,
    this.icon,
  });

  Notification.fromLocalTable(UnreadNotificationsTblData data)
    : id = data.id,
      title = data.title,
      desc = data.desc,
      timestamp = data.timestamp,
      icon = data.icon == null ? null : NotifIcon.values[data.icon!];

  UnreadNotificationsTblData toLocalTable() => UnreadNotificationsTblData(
    id: id,
    title: title,
    desc: desc,
    timestamp: timestamp,
    icon: icon?.index,
  );
}
