import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/auth/services/client_session_mgr.dart';
import 'package:doctor_appointment/features/home/widgets/nav_bar.dart';
import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/services/bookings_mgr.dart';
import 'package:doctor_appointment/features/medical/services/doctor_db_mgr.dart';
import 'package:doctor_appointment/features/medical/widget/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingsPage extends StatefulWidget {
  final ActiveSession session;
  final ClientSessionManager sessionMgr;

  const BookingsPage({
    required this.session,
    required this.sessionMgr,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _BookingsPageState();
}

class _BookedDoctor {
  final Rx<Doctor?> doctor;
  final BookingData booking;

  _BookedDoctor({required this.doctor, required this.booking});

  _BookedDoctor.fromBooking(DoctorDbManager listMgr, this.booking)
    : doctor = listMgr.find(booking.doctor);
}

class _BookingsPageState extends State<BookingsPage> {
  RxList<_BookedDoctor> upcomming = RxList([]);
  RxList<_BookedDoctor> completed = RxList([]);
  RxList<_BookedDoctor> canceled = RxList([]);

  void refreshBookings(List<BookingData> bookingsList) {
    final bdlist = bookingsList.map(
      (b) => _BookedDoctor.fromBooking(widget.session.doctorListMgr, b),
    );
    final now = DateTime.now();
    upcomming.value = List.of(
      bdlist.where(
        (b) => !b.booking.isCanceled && b.booking.datetime.isAfter(now),
      ),
    );
    completed.value = List.of(
      bdlist.where(
        (b) => !b.booking.isCanceled && b.booking.datetime.isBefore(now),
      ),
    );
    canceled.value = List.of(bdlist.where((b) => b.booking.isCanceled));
  }

  @override
  void initState() {
    widget.session.bookingsMgr.bookings.listen(refreshBookings);
    widget.session.bookingsMgr.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = ColorScheme.of(context).primary;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Bookings"),
          centerTitle: true,
          titleTextStyle: TextTheme.of(context).labelLarge!,
          bottom: TabBar(
            dividerHeight: 0,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey.shade400,
            labelStyle: TextStyle(fontWeight: .w600, fontSize: 16),
            tabs: [
              Tab(text: "Upcomming"),
              Tab(text: "Completed"),
              Tab(text: "Canceled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _BookingList(
              list: upcomming,
              primaryBtn: (_) => _RescheduleButton(),
              secondaryBtn: (b) => _CancelBooking(
                bookingsMgr: widget.session.bookingsMgr,
                id: b.id,
              ),
            ),
            _BookingList(
              list: completed,
              primaryBtn: (_) => _AddReviewButton(),
              secondaryBtn: (_) => _RebookButton(),
            ),
            _BookingList(
              list: canceled,
              primaryBtn: (_) => _RebookButton(isPrimary: true),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          session: widget.session,
          currentIndex: 2,
          sessionMgr: widget.sessionMgr,
        ),
      ),
    );
  }
}

class _RescheduleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 147,
      height: 37,
      child: FilledButton(
        onPressed: () {},
        child: const Text(
          "Reschedule",
          style: TextStyle(fontWeight: .w700, fontSize: 14),
        ),
      ),
    );
  }
}

class _AddReviewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 147,
      height: 37,
      child: FilledButton(
        onPressed: () {},
        child: const Text(
          "Add Review",
          style: TextStyle(fontWeight: .w700, fontSize: 14),
        ),
      ),
    );
  }
}

class _RebookButton extends StatelessWidget {
  final bool isPrimary;

  const _RebookButton({this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
    final style = isPrimary
        ? null
        : FilledButton.styleFrom(
            backgroundColor: Colors.grey.shade200,
            foregroundColor: ColorScheme.of(context).primary,
          );
    return SizedBox(
      width: 147,
      height: 37,
      child: FilledButton(
        onPressed: () {},
        style: style,
        child: const Text(
          "Re-Book",
          style: TextStyle(fontWeight: .w700, fontSize: 14),
        ),
      ),
    );
  }
}

class _CancelBooking extends StatelessWidget {
  final BookingsManager bookingsMgr;
  final int id;

  const _CancelBooking({required this.bookingsMgr, required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 147,
      height: 37,
      child: FilledButton(
        onPressed: () {
          bookingsMgr.cancel(id);
        },
        style: FilledButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          foregroundColor: ColorScheme.of(context).primary,
        ),
        child: const Text(
          "Cancel",
          style: TextStyle(fontWeight: .w700, fontSize: 14),
        ),
      ),
    );
  }
}

class _BookingList extends StatelessWidget {
  final Widget Function(BookingData) primaryBtn;
  final Widget Function(BookingData)? secondaryBtn;
  final RxList<_BookedDoctor> list;

  const _BookingList({
    required this.primaryBtn,
    this.secondaryBtn,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24, vertical: 16),
      child: Obx(() {
        return ListView.separated(
          itemBuilder: (_, i) => SizedBox(
            width: 342,
            child: BookingCard(
              booking: list[i].booking,
              doctor: list[i].doctor,
              primaryBtn: primaryBtn,
              secondaryBtn: secondaryBtn,
            ),
          ),
          separatorBuilder: (_, _) => SizedBox(height: 10),
          itemCount: list.length,
        );
      }),
    );
  }
}

class BookingCard extends StatelessWidget {
  final Widget Function(BookingData) primaryBtn;
  final Widget Function(BookingData)? secondaryBtn;
  final BookingData booking;
  final Rx<Doctor?> doctor;

  static DateFormat bookedTimeFormat = DateFormat.yMMMMd().add_jm();

  const BookingCard({
    required this.booking,
    required this.doctor,
    required this.primaryBtn,
    this.secondaryBtn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final btnSec = secondaryBtn == null
        ? primaryBtn(booking)
        : Row(
            children: [
              secondaryBtn!(booking),
              SizedBox(width: 16),
              primaryBtn(booking),
            ],
          );
    return Container(
      padding: .all(16),
      width: 342,
      height: 247,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .all(.circular(12)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 6,
            color: Color(0x0D000000),
          ),
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
            color: Color(0x19000000),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            bookedTimeFormat.format(booking.datetime),
            style: TextStyle(
              fontWeight: .w700,
              fontSize: 14,
              color: ColorScheme.of(context).primary,
            ),
          ),
          Divider(height: 24),
          _BcDocSec(doctor: doctor),
          Divider(height: 24),
          btnSec,
        ],
      ),
    );
  }
}

class _BcDocSec extends StatelessWidget {
  final Rx<Doctor?> doctor;

  const _BcDocSec({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (doctor.value == null) return SizedBox();
      final Doctor doc = doctor.value!;
      return Row(
        children: [
          SizedBox(
            height: 109,
            width: 109,
            child: doc.picture == null
                ? null
                : ClipRRect(
                    borderRadius: .all(.circular(12)),
                    child: Image.memory(doc.picture!),
                  ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .spaceEvenly,
            children: [
              Text(
                doc.name.capitalizeFirst!,
                style: TextTheme.of(context).titleLarge!,
              ),
              Text(
                doc.specialty.name.capitalizeFirst!,
                style: TextTheme.of(context).labelMedium,
              ),
              DoctorCardAddress(model: doc, maxChars: 24),
            ],
          ),
        ],
      );
    });
  }
}
