import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/models/client_info.dart';
import 'package:doctor_appointment/features/auth/pages/login.dart';
import 'package:doctor_appointment/features/auth/repos/client_profile.dart';
import 'package:doctor_appointment/features/auth/services/client_session_mgr.dart';
import 'package:doctor_appointment/features/home/pages/edit_profile.dart';
import 'package:doctor_appointment/features/home/pages/favorites.dart';
import 'package:doctor_appointment/features/home/widgets/nav_bar.dart';
import 'package:doctor_appointment/features/location/repos/map_distance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  final ActiveSession session;
  final ClientSessionManager sessionMgr;

  const ProfilePage({
    required this.session,
    required this.sessionMgr,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: .fromHeight(30),
        child: Center(
          child: Text(
            "Profile",
            style: TextStyle(
              color: Color(0xFF374151),
              fontSize: 20,
              fontWeight: .w600,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: .center,
        children: [
          _InfoPanel(client: session.client),
          Expanded(
            child: Padding(
              padding: .symmetric(horizontal: 24),
              child: _ProfileSections(session: session, sessionMgr: sessionMgr),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        session: session,
        sessionMgr: sessionMgr,
        currentIndex: 3,
      ),
    );
  }
}

class _ProfileSections extends StatefulWidget {
  final ActiveSession session;
  final ClientSessionManager sessionMgr;

  static const List<(String, String)> sects = [
    ("user-edit.svg", "Edit Profile"),
    ("heart.svg", "Favorites"),
    ("bell.svg", "Notifications"),
    ("gear.svg", "Settings"),
    ("message-question.svg", "Help and Support"),
    ("security-safe.svg", "Terms and Conditions"),
    ("logout.svg", "Log Out"),
  ];

  const _ProfileSections({required this.session, required this.sessionMgr});

  @override
  State<_ProfileSections> createState() => _ProfileSectionsState();
}

class _ProfileSectionsState extends State<_ProfileSections> {
  Future<void> logout() async {
    ClientSessionManager mgr = widget.sessionMgr;
    bool? answer = await showModalBottomSheet(
      context: context,
      builder: (_) => _LogoutModal(),
    );
    if (answer != null && answer) {
      await mgr.logout();
      if (!mounted) return;
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage(mgr)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<void Function()> tapTriggers = [
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditProfilePage(
              session: widget.session,
              remoteRepo: MockClientProfileRepo(),
            ),
          ),
        );
      },
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FavoritesPage(
              doctorListMgr: widget.session.doctorListMgr,
              healthCenterListMgr: widget.session.healthCenterListMgr,
              locator: widget.session.locator,
              bookingsMgr: widget.session.bookingsMgr,
              mdc: MockMapDistanceCalculator(),
            ),
          ),
        );
      },
      () {},
      () {},
      () {},
      () {},
      logout,
    ];
    return ListView.separated(
      separatorBuilder: (_, _) => Divider(height: 24, color: Color(0xFFE5E7EB)),
      itemCount: 7,
      itemBuilder: (context, i) => GestureDetector(
        onTap: tapTriggers[i],
        child: Row(
          crossAxisAlignment: .center,
          children: [
            SvgPicture.asset(
              "assets/images/${_ProfileSections.sects[i].$1}",
              width: 24,
              height: 24,
            ),
            SizedBox(width: 16),
            Text(
              _ProfileSections.sects[i].$2,
              style: TextTheme.of(context).bodyMedium!.copyWith(fontSize: 18),
            ),
            Spacer(),
            SvgPicture.asset("assets/images/arrow-right.svg"),
          ],
        ),
      ),
    );
  }
}

class _InfoPanel extends StatelessWidget {
  final ClientInfo client;

  const _InfoPanel({required this.client});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 283,
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 84,
                backgroundImage: AssetImage(
                  "assets/images/no-profile-picture.png",
                ),
                foregroundImage: client.picture == null
                    ? null
                    : MemoryImage(client.picture!),
              ),
              Positioned(
                bottom: 10,
                right: 7,
                child: SvgPicture.asset("assets/images/edit-icon.svg"),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            client.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w700,
              color: Color(0xFF1F2A37),
            ),
          ),
          SizedBox(height: 4),
          Text(
            client.phoneNumber ?? "No Phone Number",
            style: TextStyle(
              fontWeight: .w400,
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoutModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(24),
      child: Column(
        crossAxisAlignment: .center,
        children: [
          Text("Logout", style: TextTheme.of(context).labelLarge),
          Divider(height: 32, color: Colors.grey.shade200),
          Text(
            "Are you sure you want to log out?",
            style: TextStyle(
              fontWeight: .w600,
              color: Color(0xFF6B7280),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              SizedBox(
                width: 163,
                height: 41,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: ColorScheme.of(context).primary,
                  ),
                  child: const Text("Cancel"),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: 163,
                height: 41,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("Yes, Logout"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
