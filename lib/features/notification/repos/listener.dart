import 'package:doctor_appointment/features/notification/model.dart';

abstract class NotificationRepo {
	void add(void Function(Notification) handler);
}
