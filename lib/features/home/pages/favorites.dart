import 'package:doctor_appointment/features/location/repos/map_distance.dart';
import 'package:doctor_appointment/features/location/services/client_locator.dart';
import 'package:doctor_appointment/features/medical/services/bookings_mgr.dart';
import 'package:doctor_appointment/features/medical/services/doctor_db_mgr.dart';
import 'package:doctor_appointment/features/medical/services/health_center_db_mgr.dart';
import 'package:doctor_appointment/features/medical/widget/doctor_card.dart';
import 'package:doctor_appointment/features/medical/widget/health_center_card.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class FavoritesPage extends StatefulWidget {
  final DoctorDbManager doctorListMgr;
  final HealthCenterDbManager healthCenterListMgr;
  final ClientLocator locator;
  final MapDistanceCalculator mdc;
  final BookingsManager bookingsMgr;

  const FavoritesPage({
    required this.doctorListMgr,
    required this.healthCenterListMgr,
    required this.locator,
    required this.mdc,
    required this.bookingsMgr,
    super.key,
  });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late _DoctorHcLists lists;

  @override
  void initState() {
    lists = _DoctorHcLists(
      doctorListMgr: widget.doctorListMgr,
      healthCenterDbMgr: widget.healthCenterListMgr,
      locator: widget.locator,
    );
    lists.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = ColorScheme.of(context).primary;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
          centerTitle: true,
          titleTextStyle: TextTheme.of(context).labelLarge!,
          bottom: TabBar(
            dividerHeight: 0,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey.shade400,
            labelStyle: TextStyle(fontWeight: .w600, fontSize: 16),
            tabs: [
              Tab(text: "Doctors"),
              Tab(text: "Hospitals"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FavDoctorsTab(
              doctorListMgr: widget.doctorListMgr,
              bookingsMgr: widget.bookingsMgr,
            ),
            FavHealthCentersTab(
              healthCenterListMgr: widget.healthCenterListMgr,
              mdc: widget.mdc,
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorHcLists extends GetxController {
  final DoctorDbManager doctorListMgr;
  final HealthCenterDbManager healthCenterDbMgr;
  final ClientLocator locator;

  _DoctorHcLists({
    required this.doctorListMgr,
    required this.healthCenterDbMgr,
    required this.locator,
  });

  void init() {
    doctorListMgr.setupAutoFetch(locator);
    healthCenterDbMgr.setupAutoFetch(locator);
  }
}

class FavDoctorsTab extends StatelessWidget {
  final BookingsManager bookingsMgr;
  final DoctorDbManager doctorListMgr;

  const FavDoctorsTab({
    required this.doctorListMgr,
    super.key,
    required this.bookingsMgr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24, vertical: 16),
      child: Obx(() {
        final favs = List.of(
          doctorListMgr.doctors.values.where((doc) => doc.isFavorite),
        );
        return ListView.separated(
          itemBuilder: (_, i) => SizedBox(
            width: 342,
            child: DoctorCard(
              model: favs[i],
              setFavStatus: doctorListMgr.setFavorite,
              bookingsMgr: bookingsMgr,
            ),
          ),
          separatorBuilder: (_, _) => SizedBox(height: 10),
          itemCount: favs.length,
        );
      }),
    );
  }
}

class FavHealthCentersTab extends StatelessWidget {
  final HealthCenterDbManager healthCenterListMgr;
  final MapDistanceCalculator mdc;

  const FavHealthCentersTab({
    required this.healthCenterListMgr,
    required this.mdc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24, vertical: 16),
      child: Obx(() {
        final favs = List.of(
          healthCenterListMgr.healthCenters.where((hc) => hc.isFavorite),
        );
        return ListView.separated(
          itemBuilder: (_, i) => SizedBox(
            width: 342,
            child: HealthCenterCard(
              model: favs[i],
              setFavStatus: healthCenterListMgr.setFavorite,
              mdc: mdc,
            ),
          ),
          separatorBuilder: (_, _) => SizedBox(height: 10),
          itemCount: favs.length,
        );
      }),
    );
  }
}
