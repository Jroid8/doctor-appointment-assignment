import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/features/auth/services/client_session_mgr.dart';
import 'package:doctor_appointment/features/home/pages/doctor_search.dart';
import 'package:doctor_appointment/features/home/widgets/nav_bar.dart';
import 'package:doctor_appointment/features/location/repos/map_distance.dart';
import 'package:doctor_appointment/features/medical/models/specialty.dart';
import 'package:doctor_appointment/features/medical/widget/health_center_card.dart';
import 'package:doctor_appointment/features/medical/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  final ActiveSession session;
  final ClientSessionManager sessionMgr;

  const HomePage({required this.session, required this.sessionMgr, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 24, vertical: 14),
        child: Column(
          children: [
            _TopBar(session: session),
            SizedBox(height: 14),
            Expanded(child: _Body(session: session)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        session: session,
        currentIndex: 0,
        sessionMgr: sessionMgr,
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final ActiveSession session;

  const _Body({required this.session});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
	final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DoctorSearchBar(
						controller: searchController,
            onChanged: (query) {
							searchController.value = TextEditingValue(text: "");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DoctorSearchPage(
                    listMgr: widget.session.doctorListMgr,
                    locator: widget.session.locator,
                    bookingsMgr: widget.session.bookingsMgr,
                    initalQuery: query,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 14),
          Image.asset("assets/images/Banner.png"),
          SizedBox(height: 16),
          _Categories(session: widget.session),
          SizedBox(height: 16),
          _NearbyHealthCenters(session: widget.session),
        ],
      ),
    );
  }
}

class _NearbyHealthCenters extends StatefulWidget {
  final ActiveSession session;

  const _NearbyHealthCenters({required this.session});

  @override
  State<StatefulWidget> createState() => _NearbyHealthCentersState();
}

class _NearbyHealthCentersState extends State<_NearbyHealthCenters> {
  _NearbyHealthCentersState();

  @override
  void initState() {
    widget.session.healthCenterListMgr.setupAutoFetch(widget.session.locator);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Nearby Medical Centers",
              style: TextTheme.of(context).titleLarge,
            ),
            Spacer(),
            Text("See All", style: TextTheme.of(context).bodyLarge),
          ],
        ),
        SizedBox(height: 10),
        Obx(() {
          final healthCenters =
              widget.session.healthCenterListMgr.healthCenters;
          return SizedBox(
            height: 270,
            child: ListView.separated(
              itemBuilder: (_, i) => SizedBox(
                width: 232,
                height: 252,
                child: HealthCenterCard(
                  model: healthCenters[i],
                  mdc: MockMapDistanceCalculator(),
                  setFavStatus: widget.session.healthCenterListMgr.setFavorite,
                ),
              ),
              separatorBuilder: (_, _) => SizedBox(width: 4),
              itemCount: healthCenters.length,
              scrollDirection: .horizontal,
            ),
          );
        }),
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  final ActiveSession session;

  static const List<(String, String, Specialty)> _list = [
    ("Dentistry", "dentistry.svg", .dentistry),
    ("Cardiolo..", "cardiology.svg", .cardiology),
    ("Pulmono..", "pulmonology.svg", .pulmonology),
    ("General", "general.svg", .general),
    ("Neurology", "neurology.svg", .neurology),
    ("Gastroe...", "gastroenterology.svg", .gastroenterology),
    ("Laborat...", "laboratory.svg", .laboratory),
    ("Vaccina...", "vaccination.svg", .vaccination),
  ];

  const _Categories({required this.session});

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryIcons = List<Widget>.of(
      _list.map(
        (c) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DoctorSearchPage(
                  listMgr: session.doctorListMgr,
                  locator: session.locator,
                  bookingsMgr: session.bookingsMgr,
                  initialSpeciality: c.$3,
                ),
              ),
            );
          },
          child: Column(
            children: [
              SvgPicture.asset("assets/images/${c.$2}"),
              SizedBox(height: 4),
              Text(c.$1, style: TextTheme.of(context).titleMedium),
            ],
          ),
        ),
      ),
    );
    for (int i = categoryIcons.length - 1; i > 0; i--) {
      if (i == 4) continue;
      categoryIcons.insert(i, SizedBox(width: 31.33) as Widget);
    }
    return Column(
      children: [
        Row(
          children: [
            Text("Categories", style: TextTheme.of(context).titleLarge),
            Spacer(),
            Text("See All", style: TextTheme.of(context).bodyLarge),
          ],
        ),
        SizedBox(height: 10),
        Row(children: categoryIcons.sublist(0, 7)),
        SizedBox(height: 16),
        Row(children: categoryIcons.sublist(7)),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.session});

  final ActiveSession session;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .end,
      children: [
        _LocationLabel(session: session),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/bell-filled.svg"),
        ),
      ],
    );
  }
}

class _LocationLabel extends StatelessWidget {
  const _LocationLabel({required this.session});

  final ActiveSession session;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text("Location"),
        Row(
          crossAxisAlignment: .center,
          children: [
            SvgPicture.asset(
              "assets/images/map-pin.svg",
              width: 17.75,
              height: 20.5,
            ),
            SizedBox(width: 7),
            Obx(
              () => Text(
                session.locator.location.value?.label ?? "Unknown",
                style: TextTheme.of(context).labelMedium,
              ),
            ),
            SizedBox(width: 8),
            SvgPicture.asset("assets/images/arrow-down.svg"),
          ],
        ),
      ],
    );
  }
}
