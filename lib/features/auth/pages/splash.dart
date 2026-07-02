import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/models/client_info.dart';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/auth/pages/onboarding.dart';
import 'package:doctor_appointment/features/auth/repos/server.dart';
import 'package:doctor_appointment/features/auth/services/client_session_mgr.dart';
import 'package:doctor_appointment/features/home/pages/home.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPseudoState();
}

// it's a pseudo-state because I only use it for the initState method
class _SplashPseudoState extends State<SplashPage> {
  @override
  void initState() {
    initClient();
    super.initState();
  }

  Future<void> initClient() async {
    await Future.delayed(Duration(seconds: 3));
    final sessions = await LocalDB.instance.clientSessionTbl.select().get();
    if (sessions.isEmpty) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => OnboardingPage()),
        );
      }
    } else {
      final ClientSessionManager mgr = ClientSessionManager(
        LocalDB.instance,
        MockAuthServerRepo(
          ClientInfo(id: 8, name: "jamshid", email: "jamshid@gmail.com"),
          "1234",
        ),
      );
      final ActiveSession session = (await mgr.loadLocal())!;
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(session: session, sessionMgr: mgr),
          ),
        );
      }
    }

    // ClientSessionManager mgr = ClientSessionManager(
    //   LocalDB.instance,
    //   RemoteAuthServerRepo(ServerConn(), MockClientPictureRepo()),
    // );
    // ActiveSession? session = await mgr.loadLocal();
    // if (!mounted) {
    //   // this branch will *never* be taken, but the lint says I must add this.
    //   return;
    // }
    // if (session == null) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute<void>(builder: (context) => LoginPage(mgr)),
    //   );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => HomePage(session: session, sessionMgr: mgr),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/splash.png");
  }
}
