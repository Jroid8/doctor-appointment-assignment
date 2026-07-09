import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/notification/model.dart';
import 'package:doctor_appointment/features/notification/repos/listener.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

class NotificationsManager {
  final LocalDB localdb;
  final NotificationRepo remoteRepo;
  RxList<Notification> unreadNotifications = RxList();
  bool localLoaded = false;

  NotificationsManager({required this.remoteRepo, required this.localdb}) {
    remoteRepo.add(_notifRecieved);
  }

  void loadUnreadCache() async {
    if (!localLoaded) {
      for (var r in (await localdb.unreadNotificationsTbl.select().get())) {
        unreadNotifications.add(Notification.fromLocalTable(r));
      }
      localLoaded = true;
    }
  }

  void _notifRecieved(Notification model) {
    localdb.unreadNotificationsTbl.insertOne(
      model.toLocalTable(),
      mode: .insertOrReplace,
    );
    unreadNotifications.add(model);
  }

  void addListener(void Function(Notification) listener) {
    remoteRepo.add(listener);
  }

  void markAsRead(int id) {
    unreadNotifications.removeWhere((notif) => notif.id == id);
    (localdb.unreadNotificationsTbl.delete()..where((t) => t.id.equals(id)))
        .go();
  }
}
