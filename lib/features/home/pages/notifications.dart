import 'package:doctor_appointment/features/notification/manager.dart';
import 'package:doctor_appointment/features/notification/model.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:get/get.dart';

enum _TimeRange {
  today,
  yesterday,
  sevenDays,
  thirtyDays,
  rest;

  factory _TimeRange.fromDateTime(DateTime target) {
    final int daysDiff = DateTime.now().difference(target).inDays;
    if (daysDiff == 0) {
      return .today;
    } else if (daysDiff == 1) {
      return .yesterday;
    } else if (daysDiff <= 7) {
      return .sevenDays;
    } else if (daysDiff <= 30) {
      return .thirtyDays;
    } else {
      return .rest;
    }
  }

  @override
  String toString() {
    switch (this) {
      case .today:
        return "Today";
      case .yesterday:
        return "Yesterday";
      case .sevenDays:
        return "Past 7 Days";
      case .thirtyDays:
        return "Past 30 Days";
      case .rest:
        return "Rest";
    }
  }
}

class NotificationsPage extends StatefulWidget {
  final NotificationsManager notificationsMgr;

  const NotificationsPage({required this.notificationsMgr, super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    widget.notificationsMgr.loadUnreadCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        titleTextStyle: TextTheme.of(context).labelLarge!,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() {
          List<Widget> widgets = List.empty(growable: true);
          _TimeRange? curTimeRange;
          for (Notification notif
              in widget.notificationsMgr.unreadNotifications.reversed) {
            final _TimeRange timeRange = _TimeRange.fromDateTime(
              notif.timestamp,
            );
            if (curTimeRange != timeRange) {
              curTimeRange = timeRange;
              widgets.add(
                _TimeRangeHeading(
                  range: timeRange,
                  notificationsMgr: widget.notificationsMgr,
                ),
              );
            }
            widgets.add(_NotifEntry(model: notif));
          }
          return ListView(children: widgets);
        }),
      ),
    );
  }
}

class _NotifEntry extends StatelessWidget {
  final Notification model;

  const _NotifEntry({required this.model});

  String timeDiffShort() {
    final Duration dur = DateTime.now().difference(model.timestamp);
    if (dur.inDays == 0) {
      return "${dur.inHours}h";
    } else {
      return "${dur.inDays}d";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 86,
      child: Padding(
        padding: .symmetric(vertical: 8, horizontal: 0),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            SizedBox(height: 60, width: 60, child: model.icon?.icon()),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        model.title,
                        style: TextTheme.of(context).titleLarge,
                      ),
                      Spacer(),
                      Text(timeDiffShort()),
                    ],
                  ),
                  SizedBox(height: 4),
                  // Text(
                  //   model.desc,
                  //   style: TextTheme.of(context).bodyMedium,
                  //   textAlign: .left,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeRangeHeading extends StatelessWidget {
  final NotificationsManager notificationsMgr;
  final _TimeRange range;

  const _TimeRangeHeading({
    required this.range,
    required this.notificationsMgr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Text(
            range.toString(),
            style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 16),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              List<int> ids = notificationsMgr.unreadNotifications
                  .where((n) => _TimeRange.fromDateTime(n.timestamp) == range)
                  .map((n) => n.id)
                  .toList();
              for (int id in ids) {
                notificationsMgr.markAsRead(id);
              }
            },
            child: Text(
              "Mark all as read",
              style: TextTheme.of(context).titleLarge!.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
