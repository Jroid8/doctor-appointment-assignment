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

abstract class _SpecialtyFilter {
  bool predicate(Specialty spec);
}

class _AllSpecs implements _SpecialtyFilter {
  const _AllSpecs();

  @override
  bool predicate(Specialty spec) {
    return true;
  }
}

class _SpecificSpec implements _SpecialtyFilter {
  final Specialty target;

  const _SpecificSpec(this.target);

  @override
  bool predicate(Specialty spec) {
    return spec == target;
  }
}

class DoctorSearchPage extends StatefulWidget {
  final DoctorDbManager listMgr;
  final ClientLocator locator;
  final BookingsManager bookingsMgr;
  final String? initalQuery;
  final _SpecialtyFilter _initialSpeciality;

  DoctorSearchPage({
    required this.listMgr,
    required this.locator,
    required this.bookingsMgr,
    this.initalQuery,
    Specialty? initialSpeciality,
    super.key,
  }) : _initialSpeciality = initialSpeciality == null
           ? const _AllSpecs()
           : _SpecificSpec(initialSpeciality);

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
      specFilter: widget._initialSpeciality,
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
  Rx<_SpecialtyFilter> specFilter;

  _Controller({
    required this.listMgr,
    required this.locator,
    required _SpecialtyFilter specFilter,
    String? initialQuery,
  }) : query = initialQuery == null ? "".obs : initialQuery.obs,
       specFilter = Rx(specFilter);

  void refreshShownList() {
    shownDoctors.value = List.of(
      listMgr.doctors.values.where(
        (doc) =>
            (query.value.isEmpty ||
                doc.name.toLowerCase().contains(query.value.toLowerCase()) ||
                doc.address.toLowerCase().contains(
                  query.value.toLowerCase(),
                )) &&
            specFilter.value.predicate(doc.specialty),
      ),
    );
  }

  void init() {
    listMgr.setupAutoFetch(locator);
    refreshShownList();
    listMgr.doctors.listen((_) => refreshShownList());
    query.listen((_) => refreshShownList());
    specFilter.listen((_) => refreshShownList());
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
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemCount: Specialty.values.length,
        separatorBuilder: (_, _) => SizedBox(width: 8),
        itemBuilder: (_, idx) => Obx(() {
          final spec = idx == 0 ? null : Specialty.values[idx - 1];
          final selected = idx == 0
              ? c.specFilter.value is _AllSpecs
              : c.specFilter.value is _SpecificSpec &&
                    (c.specFilter.value as _SpecificSpec).target == spec;
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
              if (spec == null) {
                c.specFilter.value = _AllSpecs();
              } else {
                c.specFilter.value = _SpecificSpec(spec);
              }
            },
          );
        }),
      ),
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
