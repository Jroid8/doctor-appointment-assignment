import 'package:doctor_appointment/common/widgets/back_button.dart';
import 'package:doctor_appointment/features/location/services/client_locator.dart';
import 'package:doctor_appointment/features/medical/models/doctor.dart';
import 'package:doctor_appointment/features/medical/models/specialty.dart';
import 'package:doctor_appointment/features/medical/services/bookings_mgr.dart';
import 'package:doctor_appointment/features/medical/services/doctor_db_mgr.dart';
import 'package:doctor_appointment/features/medical/widget/doctor_card.dart';
import 'package:doctor_appointment/features/medical/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorSearchPage extends StatefulWidget {
  final DoctorDbManager listMgr;
  final ClientLocator locator;
  final BookingsManager bookingsMgr;
  final String? initalQuery;
  final Specialty? initialSpeciality;

  const DoctorSearchPage({
    required this.listMgr,
    required this.locator,
    required this.bookingsMgr,
    this.initalQuery,
    this.initialSpeciality,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DoctorSearchState();
}

class _DoctorSearchState extends State<DoctorSearchPage> {
  final TextEditingController searchController = TextEditingController();
  late _Controller c;

  @override
  void initState() {
    c = _Controller(
      locator: widget.locator,
      listMgr: widget.listMgr,
      initialQuery: widget.initalQuery,
      initialSpecialty: widget.initialSpeciality,
    );
    searchController.value = TextEditingValue(text: widget.initalQuery ?? "");
    c.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _TopBar(),
          DoctorSearchBar(
						controller: searchController,
            onChanged: (q) {
              c.query.value = q;
            },
          ),
          SizedBox(height: 14),
          _SpecSelect(c),
          SizedBox(height: 24),
          Expanded(
            child: _DocList(c: c, bookingsMgr: widget.bookingsMgr),
          ),
        ],
      ),
    );
  }
}

class _Controller extends GetxController {
  final DoctorDbManager listMgr;
  final ClientLocator locator;

  RxList<Doctor> shownDoctors = RxList([]);
  RxString query;
  Rx<Specialty?> specialty;

  _Controller({
    required this.listMgr,
    required this.locator,
    String? initialQuery,
    Specialty? initialSpecialty,
  }) : query = initialQuery == null ? "".obs : initialQuery.obs,
       specialty = initialSpecialty == null ? Rx(null) : initialSpecialty.obs;

  void refreshShownList() {
    shownDoctors.value = List.of(
      listMgr.doctors.values.where(
        (doc) =>
            (query.value.isEmpty ||
                doc.name.toLowerCase().contains(query.value.toLowerCase()) ||
                doc.address.toLowerCase().contains(
                  query.value.toLowerCase(),
                )) &&
            (specialty.value == null || doc.specialty == specialty.value),
      ),
    );
  }

  void init() {
    listMgr.setupAutoFetch(locator);
    refreshShownList();
    listMgr.doctors.listen((_) => refreshShownList());
    query.listen((_) => refreshShownList());
    specialty.listen((_) => refreshShownList());
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .centerLeft,
      children: [
        MyBackButton(),
        Center(
          child: Text(
            "All Doctors",
            style: TextStyle(
              fontWeight: .w600,
              fontSize: 20,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}

class _SpecSelect extends StatelessWidget {
  final _Controller c;

  const _SpecSelect(this.c);

  @override
  Widget build(BuildContext context) {
    final primaryColor = ColorScheme.of(context).primary;
    return SizedBox(
      height: 37,
      child: Obx(() {
        final activeSpec = c.specialty.value;
        return ListView.separated(
          scrollDirection: .horizontal,
          itemCount: Specialty.values.length,
          separatorBuilder: (_, _) => SizedBox(width: 8),
          itemBuilder: (_, idx) {
            final spec = idx == 0 ? null : Specialty.values[idx - 1];
            final selected = spec == activeSpec;
            return ChoiceChip(
              label: Text((spec?.name ?? "all").capitalizeFirst!),
              selected: selected,
              showCheckmark: false,
              backgroundColor: Colors.white,
              selectedColor: primaryColor,
              side: BorderSide(color: primaryColor),
              labelStyle: TextStyle(
                color: selected ? Colors.white : primaryColor,
                fontWeight: .w600,
                fontSize: 14,
              ),
              shape: StadiumBorder(),
              padding: .symmetric(horizontal: 20, vertical: 8),
              onSelected: (_) {
                c.specialty.value = spec;
              },
            );
          },
        );
      }),
    );
  }
}

class _DocList extends StatelessWidget {
  final _Controller c;
  final BookingsManager bookingsMgr;

  const _DocList({required this.c, required this.bookingsMgr});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = c.shownDoctors;
      return ListView.separated(
        itemBuilder: (_, i) => SizedBox(
          width: 342,
          child: DoctorCard(
            model: list[i],
            setFavStatus: c.listMgr.setFavorite,
            bookingsMgr: bookingsMgr,
          ),
        ),
        separatorBuilder: (_, _) => SizedBox(height: 4),
        itemCount: list.length,
      );
    });
  }
}
