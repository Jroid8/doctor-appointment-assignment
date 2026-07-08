import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/features/auth/services/client_session_mgr.dart';
import 'package:doctor_appointment/features/home/pages/bookings.dart';
import 'package:doctor_appointment/features/home/pages/home.dart';
import 'package:doctor_appointment/features/home/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  final ActiveSession session;
  final int currentIndex;
  final ClientSessionManager sessionMgr;

  const BottomNavBar({
    required this.session,
    required this.currentIndex,
    required this.sessionMgr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: .fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            if (currentIndex != 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      HomePage(session: session, sessionMgr: sessionMgr),
                ),
              );
            }
          case 2:
            if (currentIndex != 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      BookingsPage(session: session, sessionMgr: sessionMgr),
                ),
              );
            }
          case 3:
            if (currentIndex != 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ProfilePage(session: session, sessionMgr: sessionMgr),
                ),
              );
            }
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/home-hollow.svg"),
          activeIcon: SvgPicture.asset("assets/images/home.svg"),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/map-pin-hollow.svg"),
          activeIcon: SvgPicture.asset("assets/images/map-pin.svg"),
          label: "Map",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/calendar-hollow.svg"),
          activeIcon: SvgPicture.asset("assets/images/calendar.svg"),
          label: "Calendar",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/profile-hollow.svg"),
          activeIcon: SvgPicture.asset("assets/images/profile.svg"),
          label: "Profile",
        ),
      ],
    );
  }
}
