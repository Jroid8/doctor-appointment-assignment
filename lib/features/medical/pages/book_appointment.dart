import 'package:doctor_appointment/common/models/time.dart';
import 'package:doctor_appointment/common/widgets/success_modal.dart';
import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/services/bookings_mgr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

class BookAppointmentPage extends StatefulWidget {
  final Doctor doctor;
  final BookingsManager bookingsMgr;

  const BookAppointmentPage({
    required this.bookingsMgr,
    required this.doctor,
    super.key,
  });

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  Rx<DateTime?> choosenDate = Rx(null);
  Rx<Time?> choosenTime = Rx(null);

  void confirm() async {
    void toastError(String message) {
      toastification.show(
        context: context,
        type: .error,
        style: .fillColored,
        title: Text(message),
      );
    }

    if (choosenDate.value == null) {
      toastError("Please choose an appropriate date");
    } else if (choosenTime.value == null) {
      toastError("Please choose an appropriate time");
    } else {
      DateTime bookDate = choosenTime.value!.withDate(choosenDate.value!);
      await widget.bookingsMgr.add(
        doctor: widget.doctor.id,
        datetime: bookDate,
      );
      final DateFormat bookingFmt = DateFormat.yMMMMd().add_jm();
      if (!mounted) return;
      await showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "Success",
        barrierColor: Colors.black54,
        pageBuilder: (_, _, _) => SuccessModal(
          message:
              "Your booking with Dr. ${widget.doctor.name} is confirmed for ${bookingFmt.format(bookDate)}.",
          child: Expanded(
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                SizedBox(
                  height: 48,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Done"),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Text(
                    "Edit your appointment",
                    style: TextTheme.of(context).bodyMedium!,
                    textAlign: .center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Appointment"),
        centerTitle: true,
        titleTextStyle: TextTheme.of(context).labelLarge!,
      ),
      body: Padding(
        padding: const .only(left: 24.0, right: 24.0, bottom: 24.0),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            _DateSelect(choosenDate: choosenDate, widget: widget),
            SizedBox(height: 24),
            Text("Select Hour", style: TextTheme.of(context).headlineLarge!),
            SizedBox(height: 16),
            Expanded(
              child: _HourSelect(widget: widget, choosenTime: choosenTime),
            ),
            FilledButton(
              onPressed: confirm,
              child: Padding(
                padding: .all(12),
                child: Text(
                  "Confirm",
                  style: TextStyle(fontWeight: .w500, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateSelect extends StatelessWidget {
  const _DateSelect({required this.choosenDate, required this.widget});

  final Rx<DateTime?> choosenDate;
  final BookAppointmentPage widget;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        choosenDate.value = await showDatePicker(
          context: context,
          firstDate: DateTime.now().add(Duration(minutes: 30)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          selectableDayPredicate: (day) =>
              widget.doctor.workingTime.startDay.index <= day.weekday &&
              day.weekday <= widget.doctor.workingTime.endDay.index,
        );
      },
      child: Padding(
        padding: .all(12),
        child: Text(
          "Select Date",
          style: TextStyle(fontWeight: .w500, fontSize: 16),
        ),
      ),
    );
  }
}

class _HourSelect extends StatelessWidget {
  const _HourSelect({required this.widget, required this.choosenTime});

  final BookAppointmentPage widget;
  final Rx<Time?> choosenTime;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      crossAxisCount: 3,
      crossAxisSpacing: 13.5,
      mainAxisSpacing: 16,
      childAspectRatio: 2.5,
      children: List.of(
        widget.doctor.workingTime.officeHours.map(
          (time) => Obx(
            () => FilledButton(
              onPressed: () {
                choosenTime.value = time;
              },
              style: FilledButton.styleFrom(
                foregroundColor: choosenTime.value == time
                    ? null
                    : Colors.grey.shade500,
                backgroundColor: choosenTime.value == time
                    ? null
                    : Colors.grey.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                time.toString(),
                style: TextStyle(fontWeight: .w600, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
