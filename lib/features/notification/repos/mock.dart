import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/notification/model.dart';
import 'package:doctor_appointment/features/notification/repos/listener.dart';
import 'package:drift/drift.dart';

class MockNotificationRepo implements NotificationRepo {
  List<void Function(Notification)> listeners = [];
  bool managerListening = false;

  static MockNotificationRepo? _instance;

  static MockNotificationRepo get instance {
    _instance ??= MockNotificationRepo();
    return _instance!;
  }

  MockNotificationRepo() {
    _sendMockedNotifs();
  }

  void _sendMockedNotifs() async {
    if ((await LocalDB.instance.unreadNotificationsTbl.select().get())
        .isNotEmpty) {
      return;
    }
    await Future.delayed(Duration(seconds: 2));
    _notify(
      Notification(
        id: 4,
        title: "Appointment Success",
        desc:
            "You have successfully booked your appointment with Dr. David Patel.",
        timestamp: DateTime.now().subtract(Duration(days: 1)),
        icon: .calendarTick,
      ),
    );
    await Future.delayed(Duration(seconds: 2));
    _notify(
      Notification(
        id: 3,
        title: "Scheduled Changed",
        desc:
            "You have successfully changes your appointment with Dr. Jesica Turner.",
        timestamp: DateTime.now().subtract(Duration(hours: 8)),
        icon: .calendarEdit,
      ),
    );
    await Future.delayed(Duration(seconds: 2));
    _notify(
      Notification(
        id: 2,
        title: "Appointment Cancelled",
        desc:
            "You have successfully cancelled your appointment with Dr. David Patel.",
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
        icon: .calendarRemove,
      ),
    );
    await Future.delayed(Duration(seconds: 2));
    _notify(
      Notification(
        id: 1,
        title: "Appointment Success",
        desc:
            "You have successfully booked your appointment with Dr. Emily Walker.",
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
        icon: .calendarTick,
      ),
    );
    await Future.delayed(Duration(seconds: 2));
  }

  void _notify(Notification notif) {
    for (var h in listeners) {
      h(notif);
    }
  }

  @override
  void add(void Function(Notification) handler) {
    listeners.add(handler);
  }
}
